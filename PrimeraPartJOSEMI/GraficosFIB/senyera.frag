#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;

uniform vec3 YELLOW = vec3(1,1,0);
uniform vec3 RED = vec3(1,0,0);

void main()
{
    fragColor = frontColor;
	if (int(mod(fract(vtexCoord.x)*9, 2.0)) == 0) fragColor = vec4(YELLOW, 1.0);
	else fragColor = vec4(RED, 1.0);
}
