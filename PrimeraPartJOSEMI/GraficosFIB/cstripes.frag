#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;

uniform vec3 YELLOW = vec3(1,1,0);
uniform vec3 RED = vec3(1,0,0);

uniform int nstripes = 16;
uniform vec2 origin=vec2(0,0);

void main()
{	
	float dist = distance(vtexCoord, origin);
	if (int(mod(dist*nstripes, 2.0)) == 1) fragColor = vec4(YELLOW, 1.0);
	else fragColor = vec4(RED, 1.0);
}
