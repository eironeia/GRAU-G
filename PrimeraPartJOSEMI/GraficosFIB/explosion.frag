#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;
uniform sampler2D explosion;
uniform float time;

void main()
{
  	float slice = 1.0/30.0;
  	int frame = int(mod(time/slice, 48));
  	vec2 st = vtexCoord*vec2(1.0/8, 1.0/6);
	st.x += (frame%8)*1.0/8;
	st.y += (5-frame/8)*1.0/6;
  	fragColor=frontColor*texture(explosion, st);
	fragColor*=fragColor.w;
}
