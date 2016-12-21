#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

uniform mat4 modelViewProjectionMatrix;
uniform float time;

in vec4 vfrontColor[];
out vec4 gfrontColor;

void main( void )
{
	for( int i = 0 ; i < 3 ; i++ )
	{
		if (gl_PrimitiveIDIn <= int(100*time)) { 
		    //Cada vez que llega aqui se repinta toda la escena 
		    // primero pintamos 100primeras porque time = 1
		    // luego time = 2 entonces pintamos las 100 anteriores i las 100 nuevas dado que primite <= 200
		    gfrontColor = vfrontColor[i];
		    gl_Position = modelViewProjectionMatrix*gl_in[i].gl_Position;
		    EmitVertex();
		}
		
	}
    EndPrimitive();
}
