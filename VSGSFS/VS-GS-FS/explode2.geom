#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
in vec3 vNormal[];

out vec4 gfrontColor;

uniform mat4 modelViewProjectionMatrix;

const float speed = 0.5;
const float angSpeed = 8.0;

uniform float time;

void main( void )
{	
	vec3 translation = speed*time*(vNormal[0]+vNormal[1]+vNormal[2])/3;

	vec3 BT = (gl_in[0].gl_Position.xyz + gl_in[1].gl_Position.xyz + gl_in[2].gl_Position.xyz)/3;

	float angle=time*angSpeed;

	mat3 Rz=mat3(vec3(cos(angle), sin(angle), 0),
              	       vec3(-sin(angle), cos(angle), 0), 
              	       vec3(0, 0, 1));

	for( int i = 0 ; i < 3 ; i++ ) {
 
		gfrontColor = vfrontColor[i];
		
		vec3 V = gl_in[i].gl_Position.xyz - BT; //Portem al centre
		V = V*Rz; // Rotem respecte el eix Z
		V += BT+translation; // Tornem a la posicio i afegim el factor temps
		
		gl_Position = modelViewProjectionMatrix*vec4(V,1.0);
		EmitVertex();
	}
    EndPrimitive();
}
