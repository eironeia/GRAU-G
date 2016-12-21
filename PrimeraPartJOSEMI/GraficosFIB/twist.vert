#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform float time;

void main()
{
    vec3 N = normalize(normalMatrix * normal);
	float fi = 0.4*vertex.y*sin(time);
	mat3 rotacio = mat3(
		vec3(cos(fi),0.0,-sin(fi)),
		vec3(0.0,1.0,0.0),
		vec3(sin(fi),0.0,cos(fi))
	);

    frontColor = vec4(color,1.0);
    vtexCoord = texCoord;
	vec3 pos = rotacio*vertex;
    gl_Position = modelViewProjectionMatrix * vec4(pos, 1.0);
}
