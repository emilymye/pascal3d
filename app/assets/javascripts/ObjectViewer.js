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

  this.orbitSpeed = options["orbit_speed"] || 0;
  this.use_keypoints = options["keypoints"] || false;
  this.azimuth = options["azimuth"] || 0;
  this.elevation = options["elevation"] || 0;
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

    if ( this.use_keypoints )
      this.findVisibleKeypoints();
    
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

ObjectViewer.prototype.findVisibleKeypoints = function(keypoints){
  this.keypoints = [];
  var keypointMaterial= new THREE.MeshBasicMaterial({color:0xff00000 }), 
      radius = 0.02, 
      keypoint, caster, ray, pos, intersections, visible;

  caster = new THREE.Raycaster();
  for (pt in keypoints){
    keypoint = new THREE.Mesh( new THREE.SphereGeometry(radius), keypointMaterial );
    keypoint.userData["name"] = pt;
    keypoint.position = new THREE.Vector3(keypoints[pt].x, keypoints[pt].y, keypoints[pt].z );
    keypoint_visible = false;

    //interesect with several points
    for (var i = -1; i <= 1; i++){
      for (var j = -1; j <= 1; j++){
        for (var k = -1; k <= 1; k++){
          keypos = new THREE.Vector3(keypoints[pt].x + i * radius, keypoints[pt].y + j * radius, keypoints[pt].z + k * radius);
          ray = new THREE.Vector3();
          ray.subVectors(keypos, this.camera.position);
          ray.normalize();
          caster.set(this.camera.position, ray);
          intersections = caster.intersectObjects( [ this.mesh, keypoint ] , false );
          intersections = caster.intersectObjects( [ this.mesh, keypoint ] , false );
          if (intersections.length > 0 && intersections[0].point.distanceToSquared(keypoint.position) <= radius * radius){
            keypoint_visible = true;
          }
        }
      }
    }

    if (keypoint_visible){
      keypoint.visible = false;
      this.keypoints.push(keypoint);
      this.scene.add(keypoint)
    }

    if (this.keypoints.length > 0){
      this.currKeypoint = 0;
      this.keypoints[0].visible = true;
    }
  }
}

// ObjectViewer.prototype.changeKeypoint = function(incr){
//   if (this.currKeypoint < 0) return;
//   this.keypoints[this.currKeypoint].visible = false;
//   this.currKeypoint = this.currKeypoint + incr;
//   while (this.currKeypoint < 0) {
//     this.currKeypoint += this.keypoints.length;
//   }
//   while (this.currKeypoint >= this.keypoints.length ) {
//     this.currKeypoint -= this.keypoints.length;
//   }
//   this.keypoints[this.currKeypoint].visible = true;
// };

// ObjectViewer.prototype.getCurrentKeypoint = function(incr){
//   return this.keypoints[this.currKeypoint];
// };

// ObjectViewer.prototype.deleteCurrentKeypoint = function(incr){
//   console.log(this.keypoints.length);
//   var pt = this.keypoints.splice(this.currKeypoint, 1)[0];
//   // pt.visible = false;
//   console.log(pt);
//   this.scene.remove(pt);
//   this.changeKeypoint(0); // to make sure we stay in bounds
// };

