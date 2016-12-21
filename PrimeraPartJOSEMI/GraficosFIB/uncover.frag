#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;
in float xNDC;

uniform float time;

uniform vec4 BLUE = vec4(0,0,1,1);

void main()
{
	if (bool(step(xNDC, time))) fragColor = BLUE;
	else discard; 
}
