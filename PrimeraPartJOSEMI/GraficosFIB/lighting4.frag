#version 330 core

in vec4 frontColor;
in vec3 N;
in vec3 P;
out vec4 fragColor;

uniform vec4 lightAmbient;  // similar a gl_LightSource[0].ambient
uniform vec4 lightDiffuse;  // similar a gl_LightSource[0].diffuse
uniform vec4 lightSpecular; // similar a gl_LightSource[0].specular
uniform vec4 lightPosition; // similar a gl_LightSource[0].position; en eye space
uniform vec4 matAmbient;    // similar a gl_FrontMaterial.ambient 
uniform vec4 matDiffuse;    // similar a gl_FrontMaterial.diffuse 
uniform vec4 matSpecular;   // similar a gl_FrontMaterial.specular
uniform float matShininess; // similar a gl_FrontMaterial.shininess

vec4 Phong(vec3 N, vec3 L, vec3 V) {
	N = normalize(N);
	L = normalize(L);
	V = normalize(V);
	vec3 R = normalize(2.0*dot(N,L)*N-L);
	return matAmbient * lightAmbient +
		matDiffuse * lightDiffuse * max(0.0, dot(N,L)) +
		matSpecular * lightSpecular * pow(max(0.0, dot(R,V)), matShininess);
}

void main()
{
  	vec3 V = -P;
  	vec3 L = lightPosition.xyz-P;
    fragColor = Phong(N,L,V);
}
