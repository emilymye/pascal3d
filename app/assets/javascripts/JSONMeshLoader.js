THREE.JSONMeshLoader = function (showStatus) {
    THREE.Loader.call( this, showStatus );
    this.withCredentials = false;
};
THREE.JSONMeshLoader.prototype = Object.create( THREE.Loader.prototype );
THREE.JSONMeshLoader.prototype.load = function ( url, callback ) {
    var scope = this;
    this.onLoadStart();
    this.loadAjaxJSON( this, url, callback );
};

THREE.JSONMeshLoader.prototype.loadAjaxJSON = function ( context, url, callback, callbackProgress){
    var xhr = new XMLHttpRequest();
    var length = 0;
    xhr.onreadystatechange = function () {
        if ( xhr.readyState === xhr.DONE ) {
            if ( xhr.status === 200 || xhr.status === 0 ) {
                if ( xhr.responseText ) {
                    var json = JSON.parse( xhr.responseText );
                    var result = context.parse( json );
                    callback( result.geometry, result.keypoints );
                } else {
                    console.error( 'THREE.JSONLoader: "' + url + '" seems to be unreachable or the file is empty.' );
                }
                context.onLoadComplete();
            } else {
                console.error( 'THREE.JSONLoader: Couldn\'t load "' + url + '" (' + xhr.status + ')' );
            }
        } else if ( xhr.readyState === xhr.LOADING ) {
            if ( callbackProgress ) {
                if ( length === 0 ) {
                    length = xhr.getResponseHeader( 'Content-Length' );
                }
                callbackProgress( { total: length, loaded: xhr.responseText.length } );
            }
        } else if ( xhr.readyState === xhr.HEADERS_RECEIVED ) {
            if ( callbackProgress !== undefined ) {
                length = xhr.getResponseHeader( "Content-Length" );
            }
        }
    };

    xhr.open( "GET", url, true );
    xhr.withCredentials = this.withCredentials;
    xhr.send( null );
}

THREE.JSONMeshLoader.prototype.parse = function ( json ) {
    var scope = this,
        geometry = new THREE.Geometry(),
        scale = json.scale || 1;
    parseModel();

    geometry.mergeVertices();
    geometry.computeCentroids();
    geometry.computeFaceNormals();
    geometry.computeVertexNormals();
    geometry.computeBoundingSphere();
    
    function parseModel(){
        var vertices, faces,
            v, f, 
            offset, zLength;

        vertices = json.vertices;
        faces = json.faces;

        if (vertices === undefined || faces === undefined) 
            return;

        offset = 0;
        zLength = vertices.length;
        while (offset < zLength){
            v = new THREE.Vector3();
            v.x = vertices[offset++] * scale;
            v.y = vertices[offset++] * scale;
            v.z = vertices[offset++] * scale;
            geometry.vertices.push(v);
        }
        
        offset = 0;
        zLength = faces.length;
        while ( offset < zLength ){
            nVert = faces[ offset++];
            
            if (nVert == 3){
                f = new THREE.Face3();
                f.a = faces[offset++];
                f.b = faces[offset++];
                f.c = faces[offset++];
                geometry.faces.push(f);
            } else if (nVert == 4){
                f1 = new THREE.Face3();
                f1.a = faces[offset];
                f1.b = faces[offset + 1];
                f1.c = faces[offset + 3];
                f2 = new THREE.Face3();
                f2.a = faces[offset + 1];
                f2.b = faces[offset + 2];
                f2.c = faces[offset + 3];

                if (vertices[f1.a] == undefined ||
                    vertices[f1.b] == undefined ||
                    vertices[f1.c] == undefined)
                    console.log(f1);
                if (vertices[f2.a] == undefined ||
                    vertices[f2.b] == undefined ||
                    vertices[f2.c] == undefined)
                    console.log(f2);

                geometry.faces.push(f1);
                geometry.faces.push(f2);
                offset += 4;
            }
        }
    }

    return { geometry: geometry, keypoints: json.keypoints };
}