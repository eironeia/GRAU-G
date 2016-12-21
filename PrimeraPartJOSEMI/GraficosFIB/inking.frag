#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;

uniform int textureSize =  1024;
uniform int edgeSize = 2;
uniform float threshold = 0.1;

uniform sampler2D sampl;

uniform vec4 BLACK = vec4(0,0,0,1);

void main()
{

	vec2 left = vtexCoord + edgeSize * vec2(-1, 0) / textureSize;
	vec2 right = vtexCoord + edgeSize * vec2(1, 0) / textureSize;
	vec2 bottom = vtexCoord + edgeSize * vec2(0, -1) / textureSize;
	vec2 top = vtexCoord + edgeSize * vec2(0, 1) / textureSize;

	float GX = length(texture(sampl, right) - texture(sampl, left));
	float GY = length(texture(sampl, top) - texture(sampl, bottom));
	
	float d = length(vec2(GX, GY));

	if (d > threshold) fragColor = BLACK;
	else fragColor = texture(sampl, vtexCoord);
}
