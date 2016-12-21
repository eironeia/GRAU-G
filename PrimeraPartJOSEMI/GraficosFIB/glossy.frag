#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;
in vec3 N;
in vec3 P;

const float W=512;
const float H=512;

uniform int r=10;
uniform sampler2D glossy;

vec4 sampleTexture(sampler2D sampler, vec2 st, int r)
{
	float e = 1.0/((2.0*r+1.0)*(2.0*r+1.0));
	vec4 C = vec4(0);
	for (int i = -r; i <= r; ++i) {
		for (int j = -r; j <= r;++j) {
			C += texture2D(sampler, st+vec2(i/W, j/H));
		}
	}
	return e*C;
}

vec4 sampleSphereMap(sampler2D sampler, vec3 R) {
	float z=sqrt((R.z+1.0)/2.0);
	vec2 st=vec2((R.x/(2.0*z)+1.0)/2.0, (R.y/(2.0*z)+1.0)/2.0);
  	st.y=-st.y;
	return sampleTexture(sampler, st, r);
}

void main() {
	vec3 obs=vec3(0.0);
	vec3 I=normalize(P-obs);
	vec3 R=reflect(I, N);
	fragColor=sampleSphereMap(glossy, R);
}
