#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec4 vtexCoord;

uniform vec4 RED = vec4(1,0,0,1);
uniform vec4 WHITE = vec4(1,1,1,1);

void main()
{
	float radi = 0.2;
	vec2 C = vec2(0.5,0.5);
	float d = length(vtexCoord.xy-C);
	if (bool(step(radi, d))) fragColor = WHITE;
	else fragColor = RED;
}
