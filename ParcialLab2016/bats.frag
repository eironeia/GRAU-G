#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D bat0;
uniform sampler2D bat1;
uniform float time;

void main()
{
    vec4  colorBat0 = texture(bat0, gl_FragCoord.xy/64 - time); 
   	vec4  colorBat1 = texture(bat1, gl_FragCoord.xy/64 - time); 
	vec4  resultColor;
	
	bool case1 = mod(fract(time), 5) < 0.05;
	bool case2 = mod(fract(time), 5) >= 0;
	if (case1 && case2) resultColor = colorBat0;
	else resultColor = colorBat1;
	
	if (bool(step(0.2, resultColor.w))) fragColor = vec4(0,0,0,1);
	else fragColor = frontColor;

}
