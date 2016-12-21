#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewProjectionMatrixInverse;
uniform vec3 boundingBoxMin;

in vec4 vfrontColor[];
out vec4 gfrontColor;

void main( void ) {

	for( int i = 0 ; i < 3 ; i++ ) {
		gfrontColor = vfrontColor[i];
		gl_Position = modelViewProjectionMatrix*gl_in[i].gl_Position;
		EmitVertex();
	}
    EndPrimitive();

	vec4 black = vec4(0,0,0,1);
	for( int i = 0 ; i < 3 ; i++ ) {
		gfrontColor = black;
		vec4 V = gl_in[i].gl_Position;
		V.y = boundingBoxMin.y;
		gl_Position=modelViewProjectionMatrix*V;
		EmitVertex();
	}
    EndPrimitive();
}
