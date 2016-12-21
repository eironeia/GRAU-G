#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
in vec4 vNormal[];

out vec3 gNormal;
out vec4 gfrontColor;

uniform float speed = 1.0;
uniform float time;

uniform mat4 modelViewProjectionMatrix;

vec3 getNormal(vec3 A, vec3 B, vec3 C) {
  vec3 P=B-A;
  vec3 Q=C-A;
  return vec3(P.y*Q.z-P.z*Q.y,P.z*Q.x-P.x*Q.z,P.x*Q.y-P.y*Q.x);
}

void printVertex(vec4 vertex) {
    
    gl_Position = modelViewProjectionMatrix * vertex;
    EmitVertex();
}

void main( void )
{
	 vec4 normal = normalize((vNormal[0] + vNormal[1] + vNormal[2])/3);
     
	 //Inicials
	 
    vec4 v1 = gl_in[0].gl_Position; 
    vec4 v2 = gl_in[1].gl_Position; 
    vec4 v3 = gl_in[2].gl_Position;
	 
	gNormal = normalize(getNormal(v1.xyz, v2.xyz, v3.xyz));
  

    
    EndPrimitive();
    
    if (int(time)%2 == 0) {
        if (gl_PrimitiveIDIn%2 == 0) {
            gfrontColor = vfrontColor[0]; printVertex(v1);
            gfrontColor = vfrontColor[1]; printVertex(v2);
            gfrontColor = vfrontColor[2]; printVertex(v3);
        }
    }
    if (int(time)%2 != 0) {
        if (gl_PrimitiveIDIn%2 != 0) {
            gfrontColor = vfrontColor[0]; printVertex(v1);
            gfrontColor = vfrontColor[1]; printVertex(v2);
            gfrontColor = vfrontColor[2]; printVertex(v3);
        }
    }
          
}