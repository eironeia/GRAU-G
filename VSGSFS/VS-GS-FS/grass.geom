#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
in vec4 vNormal[];


out vec4 gfrontColor;
out vec3 gNormal;
out vec3 gPos;


uniform mat4 modelViewProjectionMatrix;

const float d = 0.1;

vec3 getNormal(vec3 A, vec3 B, vec3 C) {
  vec3 P=B-A;
  vec3 Q=C-A;
  return vec3(P.y*Q.z-P.z*Q.y,P.z*Q.x-P.x*Q.z,P.x*Q.y-P.y*Q.x);
}

void printVertex(vec4 vertex) {
    gPos = vertex.xyz;
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
    gNormal = -normalize(getNormal(v1.xyz, v2.xyz, v3.xyz));
    printVertex(v1); printVertex(v2); printVertex(v3);
    EndPrimitive();
    
    
    //Desti
    vec4 dN = d*vec4(normal.xyz,0.0); 
    
    vec4 v4 = v1-dN; 
    vec4 v5 = v2-dN; 
    vec4 v6 = v3-dN; 
    
    //gNormal = -normalize(getNormal(v4.xyz, v5.xyz, v6.xyz));
    //printVertex(v4); printVertex(v5); printVertex(v6);
    //EndPrimitive();
    
    //Intermitgos
    gNormal = -normalize(getNormal(v1.xyz, v2.xyz, v4.xyz));
    printVertex(v1);    printVertex(v2);
    printVertex(v4);    printVertex(v5);
    EndPrimitive();
    
    //Intermitgos
    gNormal = -normalize(getNormal(v1.xyz, v4.xyz, v3.xyz));
    printVertex(v1); printVertex(v4);    
    printVertex(v3); printVertex(v6);
    EndPrimitive();
    
    //Intermitgos
    gNormal = -normalize(getNormal(v2.xyz, v3.xyz, v5.xyz));
    printVertex(v2);    printVertex(v3);
    printVertex(v5);    printVertex(v6);
    EndPrimitive();
    
        
    
	
	
}
