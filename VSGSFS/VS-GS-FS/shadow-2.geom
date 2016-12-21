#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewProjectionMatrixInverse;

uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;

in vec4 vfrontColor[];
out vec4 gfrontColor;

const vec4 BLACK=vec4(0, 0, 0, 1);
const vec4 CYAN=vec4(0, 1, 1, 1);

void main( void ) {

	for( int i = 0 ; i < 3 ; i++ ) {
		gfrontColor = vfrontColor[i];
		gl_Position = modelViewProjectionMatrix*gl_in[i].gl_Position;
		EmitVertex();
	}
    EndPrimitive();

	for( int i = 0 ; i < 3 ; i++ ) {
		gfrontColor = BLACK;
		vec4 V = gl_in[i].gl_Position;
		V.y = boundingBoxMin.y;
		gl_Position=modelViewProjectionMatrix*V;
		EmitVertex();
	}
    EndPrimitive();

	if ( gl_PrimitiveIDIn == 0 ) {
		float R = (distance(boundingBoxMin, boundingBoxMax))/2;
		float cx = (boundingBoxMax.x + boundingBoxMin.x)/2;
		float cz = (boundingBoxMax.z + boundingBoxMin.z)/2;

		gfrontColor = vec4(0.0, 1.0, 1.0, 1.0);
		gl_Position = modelViewProjectionMatrix *vec4(cx - R, boundingBoxMin.y - 0.01, cz - R, 1.0);
		EmitVertex();

		gfrontColor = vec4(0.0, 1.0, 1.0, 1.0);
		gl_Position = modelViewProjectionMatrix *vec4(cx - R, boundingBoxMin.y - 0.01, cz + R, 1.0);
		EmitVertex();

		gfrontColor = vec4(0.0, 1.0, 1.0, 1.0);
		gl_Position = modelViewProjectionMatrix *vec4(cx + R, boundingBoxMin.y - 0.01, cz - R, 1.0);
		EmitVertex();
		EndPrimitive();

		gfrontColor = vec4(0.0, 1.0, 1.0, 1.0);
		gl_Position = modelViewProjectionMatrix *vec4(cx + R, boundingBoxMin.y - 0.01, cz + R, 1.0);
		EmitVertex();

		gfrontColor = vec4(0.0, 1.0, 1.0, 1.0);
		gl_Position = modelViewProjectionMatrix *vec4(cx - R, boundingBoxMin.y - 0.01, cz + R, 1.0);
		EmitVertex();

		gfrontColor = vec4(0.0, 1.0, 1.0, 1.0);
		gl_Position = modelViewProjectionMatrix *vec4(cx + R, boundingBoxMin.y - 0.01, cz - R, 1.0);
		EmitVertex();
		EndPrimitive();
	}

}
