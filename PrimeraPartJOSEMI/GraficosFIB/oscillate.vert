#version 330 core
#define M_PI 3.1415926535897932384626433832795

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewMatrix;
uniform mat4 modelMatrixInverse;
uniform mat3 normalMatrix;
uniform float time;

uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;

uniform bool eyespace;

void main()
{
    vec3 N = normalize(normalMatrix * normal);
	float y = vertex.y;
	if (eyespace) y = (modelViewMatrix*vec4(vertex, 1.0)).y;

	float r = distance(boundingBoxMax, boundingBoxMin)/2.0;
	float d = (r/10.0)*y;

	//Color
    frontColor = vec4(color, 1.0);

	//Textura
    vtexCoord = texCoord;

	//Posicion del vertice
	vec3 V = vertex + normal*d*sin(time);
    gl_Position = modelViewProjectionMatrix * vec4(V, 1.0);
}
