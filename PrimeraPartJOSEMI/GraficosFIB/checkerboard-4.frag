#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;

uniform float n = 8;
uniform vec3 RED = vec3(1,0,0);

void main()
{
	float x = vtexCoord.x*n;
	float y = vtexCoord.y*n;
	if (fract(y)<0.1 || fract(x)<0.1) fragColor = vec4(RED, 1.0);
	else discard;
}
