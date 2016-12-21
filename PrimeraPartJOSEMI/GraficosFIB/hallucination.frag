#version 330 core
#define M_PI 3.1415926535897932384626433832795

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D colorMap;
uniform float speed=0.1;
uniform float time;
uniform float a = 0.5;

void main()
{
	float fi = 2*M_PI*time;
  	vec4 TC = texture(colorMap, vtexCoord);
	float m = max(TC.x, max(TC.y, TC.z));
	mat2 rotacio = mat2(vec2(cos(fi), sin(fi)), vec2(-sin(fi), cos(fi)));
	vec2 u = rotacio*vec2(m,m);
	vec2 offset = (a/100)*u;
    fragColor = frontColor * texture(colorMap, vtexCoord+offset);
}
