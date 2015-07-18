"use strict";

var canvas;
var gl;

var points = [];


var gui = new dat.GUI();
var settings = {
  numDivisions: 3,
  angle:        1,
}
gui.add(settings, 'numDivisions', 0, 5).step(1).onChange(render)
gui.add(settings, 'angle', -Math.PI, Math.PI).onChange(render)

var numTimesToSubdivide = 3;

var bufferId;

function init()
{
  canvas = document.getElementById( "gl-canvas" );

  gl = WebGLUtils.setupWebGL( canvas );
  if ( !gl ) { alert( "WebGL isn't available" ); }

  //
  //  Initialize our data for the Sierpinski Gasket
  //

  // First, initialize the corners of our gasket with three points.


  //
  //  Configure WebGL
  //
  gl.viewport( 0, 0, canvas.width, canvas.height );
  gl.clearColor( 1.0, 1.0, 1.0, 1.0 );

  //  Load shaders and initialize attribute buffers

  var program = initShaders( gl, "vertex-shader", "fragment-shader" );
  gl.useProgram( program );

  // Load the data into the GPU

  bufferId = gl.createBuffer();
  gl.bindBuffer( gl.ARRAY_BUFFER, bufferId );
  gl.bufferData( gl.ARRAY_BUFFER, 8*Math.pow(3, 6), gl.STATIC_DRAW );



  // Associate out shader variables with our data buffer

  var vPosition = gl.getAttribLocation( program, "vPosition" );
  gl.vertexAttribPointer( vPosition, 2, gl.FLOAT, false, 0, 0 );
  gl.enableVertexAttribArray( vPosition );

  render();
};

function triangle( a, b, c ){
  points.push( a, b, c );
}

function rotate(p, θ){
  return [
    p[0]*Math.cos(θ) - p[1]*Math.sin(θ),
    p[0]*Math.sin(θ) + p[1]*Math.cos(θ), 
  ]
}

function divideTriangle( a, b, c, count )
{

  // check for end of recursion

  if ( count == 0 ) {
    triangle( a, b, c );
  }
  else {

    //bisect the sides

    var ab = mix( a, b, 0.5 );
    var ac = mix( a, c, 0.5 );
    var bc = mix( b, c, 0.5 );

    --count;

    // three new triangles

    divideTriangle( a, ab, ac, count );
    divideTriangle( c, ac, bc, count );
    divideTriangle( b, bc, ab, count );
    // divideTriangle( ab, bc, ac, count );

  }
}

window.onload = init;

function render()
{
  var vertices = [
    vec2( -1, -1 ),
    vec2(  0,  1 ),
    vec2(  1, -1 )
  ];
  points = [];
  divideTriangle( vertices[0], vertices[1], vertices[2], settings.numDivisions);

  points = points.map(function(d){ return rotate(d, settings.angle) })

  gl.bufferSubData(gl.ARRAY_BUFFER, 0, flatten(points));
  gl.clear( gl.COLOR_BUFFER_BIT );
  gl.drawArrays( gl.TRIANGLES, 0, points.length );
  points = [];
  //requestAnimFrame(render);
}
