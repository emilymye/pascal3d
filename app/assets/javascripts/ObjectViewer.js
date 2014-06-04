/*
  OBJECT VIEWER

  options:
  orbit_speed - rotate mesh at certain speed
  keypoints - in keypoint mode
  azimuth - set azimuth
  elevation - set elevation
  onLoaded - callback when mesh has finished loading
*/


var ObjectViewer = function( mesh, canvas_id, options) {
  options = options || {}
  var ambientLight, directionalLight, w,h, loader, onLoaded;

  this.orbitSpeed = options.orbit_speed || 0;
  this.azimuth = options.azimuth || 0;
  this.elevation = options.elevation || 0;

  onLoaded = options.onLoaded || function (){}

  this.scene = new THREE.Scene();  
  
  this.canvas = document.getElementById(canvas_id);
  
  w = this.canvas.width;
  h = this.canvas.height;

  this.camera = new THREE.PerspectiveCamera(60.0,w/h, 0.1, 100);
  this.camera.position = new THREE.Vector3(
    Math.cos(this.elevation) * Math.sin(this.azimuth),
    Math.cos(this.elevation) * -Math.cos(this.azimuth),
    Math.sin(this.elevation)
  );
  this.camera.up = new THREE.Vector3(0, 0, 1);
  this.camera.lookAt(this.scene.position);
  this.scene.add(this.camera);

  // ==========    LIGHTING SETUP
  ambientLight = new THREE.AmbientLight( 0x909090 );
  directionalLight = new THREE.DirectionalLight( 0xffffff );
  directionalLight.position.set( 1, 0.75, 0.5 ).normalize();
  directionalLight = new THREE.DirectionalLight( 0xffffff, 0.7);
  directionalLight.position.set( 0, -1, 0 ).normalize();
  this.scene.add( ambientLight );
  this.scene.add( directionalLight );

  this.renderer = new THREE.WebGLRenderer({ canvas: this.canvas, antialias: true });
  this.renderer.setClearColor(0xdedede);

  function onParsed(geometry,keypoints) {
    var solidMat = new THREE.MeshBasicMaterial({ color: 0xeeeeee, shading: THREE.FlatShading });
    var wireMat =  new THREE.MeshBasicMaterial({ color: 0x0000ff, wireframe:true});
    this.mesh = new THREE.Mesh(geometry, solidMat);
    var meshWire = new THREE.Mesh(geometry, wireMat);
    this.scene.add(this.mesh);
    this.scene.add(meshWire);

    this.keypoints = keypoints;
    this.animate();
    onLoaded();
  }

  loader = new THREE.JSONMeshLoader();
  loader.load( "/meshes/" + mesh, onParsed.bind(this));
}


ObjectViewer.prototype.animate = function () {
    requestAnimationFrame( this.animate.bind(this) );
    this.render();
};

ObjectViewer.prototype.render = function () {
    this.azimuth += this.orbitSpeed 
    this.camera.position = new THREE.Vector3(
      Math.cos(this.elevation) * Math.sin(this.azimuth),
      Math.cos(this.elevation) * -Math.cos(this.azimuth),
      Math.sin(this.elevation)
    );
    
    this.camera.up = new THREE.Vector3(0,0,1);   
    this.camera.up.normalize();
    this.camera.lookAt(this.scene.position);
    this.renderer.render( this.scene, this.camera );
    this.renderer.render( this.scene, this.camera );
};

ObjectViewer.prototype.setAzimuth = function( angle ){
  if (isNaN(angle)) return;
  this.azimuth = angle;
}

ObjectViewer.prototype.setElevation = function( angle ){
  if (isNaN(angle)) return;
  this.elevation = angle;
}

ObjectViewer.prototype.findVisibleKeypoints = function() {
  if (this.keypoints === undefined) return;

  var keypoints = {},
      keypointMaterial= new THREE.MeshBasicMaterial({color:0xff00000 }), 
      caster = new THREE.Raycaster(), ray, intersections,
      radius = 0.02, name, pt, keypoint_visible, keypos;

  for (name in this.keypoints){
    pt = new THREE.Mesh( new THREE.SphereGeometry(radius), keypointMaterial );
    pt.position = new THREE.Vector3(this.keypoints[name].x, this.keypoints[name].y, this.keypoints[name].z );
    keypoint_visible = false;

    //interesect with several points
    for (var i = -1; i <= 1; i++){
      for (var j = -1; j <= 1; j++){
        for (var k = -1; k <= 1; k++){
          keypos = new THREE.Vector3(i * radius, j * radius, k * radius)
          keypos.add(pt.position);
          ray = new THREE.Vector3();
          ray.subVectors(keypos, this.camera.position);
          ray.normalize();
          caster.set(this.camera.position, ray);
          intersections = caster.intersectObjects( [ this.mesh, pt ] , false );
          intersections = caster.intersectObjects( [ this.mesh, pt ] , false );
          if (intersections.length > 0 && intersections[0].point.distanceToSquared(pt.position) <= radius * radius){
            keypoint_visible = true;
          }
        }
      }
    }

    if (keypoint_visible){
      keypoints[name] = this.keypoints[name];
    }
  }
  return keypoints;
}


ObjectViewer.prototype.loadKeypointMeshes = function( keypts ){
  this.keypoint_objects = {};
  var keypointMaterial= new THREE.MeshBasicMaterial({color:0xff00000 }), 
    name, pt;
  for (name in keypts){
    pt = new THREE.Mesh( new THREE.SphereGeometry(0.02), keypointMaterial );
    pt.position = new THREE.Vector3(keypts[name].x, keypts[name].y, keypts[name].z );
    pt.visible = false;
    this.scene.add(pt);
    this.keypoint_objects[name] = pt;
  }
  this.currentKeypoint = "";
}


ObjectViewer.prototype.setCurrentKeypoint = function( name ){
  if (this.currentKeypoint.length > 0 && this.currentKeypoint in this.keypoint_objects)
    this.keypoint_objects[this.currentKeypoint].visible = false;
  this.keypoint_objects[name].visible = true;
  this.currentKeypoint = name;
}