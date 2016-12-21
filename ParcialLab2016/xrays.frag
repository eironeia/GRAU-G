#version 330 core

in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D foot0;
uniform sampler2D foot1;
uniform sampler2D foot2;
uniform sampler2D foot3;

const float R = 80.0;

uniform int layer = 1;

uniform vec2 mousePosition;
uniform bool virtualMouse = false;
uniform float mouseX, mouseY; 


vec2 mouse()
{
	if (virtualMouse) return vec2(mouseX, mouseY);
	else return mousePosition;
}

void main()
{
	vec4 colorPell = texture(foot0, vtexCoord); 
	float d = 1; // Càlcul distancia en pixels mouse
	if (d >= R) fragColor = colorPell;
	else {
		if (layer == 1) {
			vec4 colorFoot1 = texture(foot1, vtexCoord);
		}
		
		
	}
	



}

