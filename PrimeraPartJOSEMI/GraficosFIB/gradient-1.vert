#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;

void main()
{
    vec3 N = normalize(normalMatrix * normal);
	float y = 4*(vertex.y - boundingBoxMin.y) / abs(boundingBoxMax.y - boundingBoxMin.y);

	vec3 red = vec3(1,0,0);
	vec3 green = vec3(0,1,0);
	vec3 blue = vec3(0,0,1);
	vec3 yellow = green+red;
	vec3 cian = green+blue;

	vec3 color;

	if (y == 0) color = red;
	else if (y < 1) color = vec3(mix(red, yellow, fract(y)));
	else if (y < 2) color = vec3(mix(yellow, green, fract(y)));
	else if (y < 3) color = vec3(mix(green, cian, fract(y)));
	else if (y < 4) color = vec3(mix(cian, blue, fract(y)));
	else color = blue;

    frontColor = vec4(color, 1.0);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
