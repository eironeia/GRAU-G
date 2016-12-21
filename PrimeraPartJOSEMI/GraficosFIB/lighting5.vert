#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

out vec3 N;
out vec3 L;
out vec3 V;

out vec3 Nworld;
out vec3 Lworld;
out vec3 Vworld;

uniform mat4 modelMatrix;
uniform mat4 modelViewMatrix;
uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform mat4 modelViewMatrixInverse;

uniform vec4 lightPosition; // similar a gl_LightSource[0].position; en eye space

void main()
{
  	vec3 P = (modelViewMatrix*vec4(vertex.xyz, 1)).xyz;
  	N = normalMatrix*normal;
  	V = -P;
  	L = lightPosition.xyz-P;
  	// world
  	Nworld = normal;
  	Vworld = (modelViewMatrixInverse*vec4(0,0,0,1)).xyz-vertex.xyz;
	Lworld = (modelViewMatrixInverse*lightPosition).xyz-vertex.xyz;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
