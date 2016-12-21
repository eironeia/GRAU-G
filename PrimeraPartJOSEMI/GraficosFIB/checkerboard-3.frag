#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;

uniform float n = 8;
uniform vec3 WHITE = vec3(1,1,1);
uniform vec3 BLACK = vec3(0,0,0);
uniform vec3 GREY = vec3(0.8,0.8,0.8);

void main()
{
    fragColor = frontColor;
	float x = vtexCoord.x*n;
	float y = vtexCoord.y*n;
	if (fract(y)>0.1 && fract(x)>0.1) fragColor = vec4(GREY, 1.0);
	else fragColor = vec4(BLACK, 1.0);
}
