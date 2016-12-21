#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;

uniform float time;
uniform sampler2D sampler;

void main()
{
	vec2 ull = vec2(0.393, 0.652);
	vec2 boca = vec2(0.45, 0.48);
	vec2 offset = vec2(0.057, -0.172);
	float radi = 0.025;
	fragColor = texture(sampler, vtexCoord);
	if (fract(time) > 0.5) {
		float d = length(vtexCoord.xy-ull);
		if (!bool(step(radi, d))) fragColor = texture(sampler, vtexCoord+offset);
    }
}
