#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
in vec3 vNormal[];

out vec4 gfrontColor;

uniform mat4 modelViewProjectionMatrix;

const float speed = 0.5;

uniform float time;

void main( void )
{	
	vec3 translation = speed*time*(vNormal[0]+vNormal[1]+vNormal[2])/3;

	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
		
		gl_Position = modelViewProjectionMatrix*(gl_in[i].gl_Position+vec4(translation,1.0));
		EmitVertex();
	}
    EndPrimitive();
}
