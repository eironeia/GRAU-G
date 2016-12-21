#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec3 V;
in vec3 N;
in vec2 vtexCoord;

uniform sampler2D noise;
uniform mat4 modelViewMatrix;
uniform mat3 normalMatrix;
uniform vec4 WHITE = vec4(1);
uniform vec4 REDISH = vec4(0.5,0.2,0.2,1);

vec4 shading(vec3 N, vec3 V, vec4 diffuse) {
  N=normalize(N);
  V=normalize(V);
  const vec3 lightPos=vec3(0, 0, 2);
  vec3 L=normalize(lightPos-V);
  vec3 R=reflect(-L, N); 
  float NdotL=max(0, dot(N, L));
  float RdotV=max(0, dot(R, -V));
  float Ispec=pow(RdotV, 20);
  return diffuse*NdotL+Ispec;
}


void main()
{
	vec4 SPLANE = 0.3*vec4(0,1,-1,0);
	vec4 TPLANE = 0.3*vec4(-2,-1,1,0);
	
	vec4 vCoords = vec4(V,1);
	float s = dot(vCoords, SPLANE);
	float t = dot(vCoords, TPLANE);
 	vec2 texCoord=vec2(s, t);

	float v = 2*texture(noise, texCoord).x;
	vec4 diffuse=WHITE;
	if (v<1) diffuse=mix(WHITE, REDISH, fract(v));
	else if (v<2) diffuse=mix(REDISH, WHITE, fract(v));
	
	vec3 NE=normalMatrix*N;
	vec3 VE = (modelViewMatrix*vCoords).xyz;
	fragColor = shading(NE, VE, diffuse);
}
