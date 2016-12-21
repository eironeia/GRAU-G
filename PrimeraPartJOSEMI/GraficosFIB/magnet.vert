#version 330 core
#define M_PI 3.1415926535897932384626433832795

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform vec4 lightPosition; // similar a gl_LightSource[0].position; en eye space
uniform mat3 normalMatrix;
uniform mat4 modelViewMatrix;
uniform mat4 modelViewMatrixInverse;
uniform float amplitude=0.1;
uniform float freq = 1;
uniform float time;
uniform float n = 4;

void main()
{
    vtexCoord = texCoord;
    vec3 N = normalize(normalMatrix * normal);

	//Posicion de la LUZ en object space
 	vec3 F=(modelViewMatrixInverse*lightPosition).xyz;

	//Variable d
	float d = distance(vertex, F);
 
	//Variable w
	float w = clamp((1/pow(d, n)), 0, 1);

	//Nuevo vertice
	vec3 V = (1.0-w)*vertex + w*F;

    frontColor = vec4(N.z);
    gl_Position = modelViewProjectionMatrix * vec4(V, 1.0);
}
