#version 330 core

in vec4 frontColor;
in vec3 myvertex;
out vec4 fragColor;

void main()
{
	vec3 dx = dFdx(myvertex);
	vec3 dy = dFdy(myvertex);
	vec3 N = normalize(cross(dx, dy));
    fragColor = frontColor * N.z;
}
