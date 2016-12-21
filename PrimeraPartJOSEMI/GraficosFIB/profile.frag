#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec3 N;
in vec3 P;

uniform float epsilon = 0.1;
uniform float light = 0.5;

uniform vec3 YELLOW = vec3(0.7, 0.6, 0.0);

void main()
{
	float fi = dot(normalize(-P), normalize(N));
	if (fi < epsilon) fragColor = vec4(YELLOW, 1.0);
	else fragColor=frontColor*light*N.z;
}
