#version 330 core
#define M_PI 3.1415926535897932384626433832795

in vec4 frontColor;
out vec4 fragColor;
in vec4 vtexCoord;

uniform vec4 RED = vec4(1,0,0,1);
uniform vec4 WHITE = vec4(1,1,1,1);
uniform bool classic;

void main()
{
	//Dibujar cosas en base al radio y a la distancia entre un punto y otro de las coordenadas de textura.
	float radi = 0.2;
	vec2 C = vec2(0.5,0.5);
	float d = length(vtexCoord.xy-C);
	if (bool(step(radi, d))) fragColor = WHITE;
	else fragColor = RED;
	if (!classic) {
		float fi = M_PI/16;
		vec2 u = vtexCoord.xy-C;
		float angle = atan(u.y, u.x);
		if (mod(angle/fi+0.5, 2) < 1) {
			fragColor = RED;
		}
	}
}
