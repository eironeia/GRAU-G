#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform float time;
uniform float slice=0.1;
uniform sampler2D sampler0;
uniform sampler2D sampler1;
uniform sampler2D sampler2;
uniform sampler2D sampler3;

uniform sampler2D samplers[4];

void main()
{
  	int frame = int(mod(time/slice, 4));
	if (frame == 0) fragColor=frontColor*texture(sampler0, vtexCoord);
	if (frame == 1) fragColor=frontColor*texture(sampler1, vtexCoord);
	if (frame == 2) fragColor=frontColor*texture(sampler2, vtexCoord);
	if (frame == 3) fragColor=frontColor*texture(sampler3, vtexCoord);
	fragColor*=fragColor.w;
}
