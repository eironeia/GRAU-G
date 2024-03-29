#version 330 core

in vec4 frontColor;

in vec3 N;
in vec3 L;
in vec3 V;

in vec3 Nworld;
in vec3 Lworld;
in vec3 Vworld;

out vec4 fragColor;

uniform mat4 modelMatrix;
uniform mat4 viewMatrix;
uniform mat4 projectionMatrix;
uniform mat4 modelViewMatrix;
uniform mat4 modelViewProjectionMatrix;

uniform mat4 modelMatrixInverse;
uniform mat4 viewMatrixInverse;
uniform mat4 projectionMatrixInverse;
uniform mat4 modelViewMatrixInverse;
uniform mat4 modelViewProjectionMatrixInverse;

uniform mat3 normalMatrix;

uniform vec4 lightAmbient;  // similar a gl_LightSource[0].ambient
uniform vec4 lightDiffuse;  // similar a gl_LightSource[0].diffuse
uniform vec4 lightSpecular; // similar a gl_LightSource[0].specular
uniform vec4 lightPosition; // similar a gl_LightSource[0].position; en eye space
uniform vec4 matAmbient;    // similar a gl_FrontMaterial.ambient 
uniform vec4 matDiffuse;    // similar a gl_FrontMaterial.diffuse 
uniform vec4 matSpecular;   // similar a gl_FrontMaterial.specular
uniform float matShininess; // similar a gl_FrontMaterial.shininess

uniform vec3 boundingBoxMin; // cantonada minima de la capsa englobant 
uniform vec3 boundingBoxMax; // cantonada maxima de la capsa englobant

uniform vec2 mousePosition;  // coordenades del cursor (window space; origen a la cantonada inferior esquerra)
uniform bool world;

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
	if (world) fragColor = Phong(Nworld, Lworld, Vworld);
	else fragColor = Phong(N, L, V);
}
