#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
in vec3 vNormal[];
out vec2 gtexCoord;
out vec3 gnormal;
out vec4 gfrontColor;

out float isTop;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

vec4 color = vec4(0.0);

uniform float step = 0.2;


const vec4 GreyColor = vec4(vec3(0.8),1.0);

void pintaCara(bool x, bool y, bool z, vec3 BT, vec3 normal) {
    gfrontColor = color;
    gnormal=normal;
    gtexCoord = vec2(z?1:0,x?1:0);
    
    vec3 vertex = vec3(x?1:0,y?1:0,z?1:0)*step;
    gl_Position = modelViewProjectionMatrix*vec4(vertex+BT,1);
    EmitVertex();
    
    
}

void main( void )
{
    vec3 BT=(gl_in[0].gl_Position.xyz+
          gl_in[1].gl_Position.xyz+
          gl_in[2].gl_Position.xyz)/3;
    BT /= step;
    BT.x = round(BT.x);
    BT.y = round(BT.y);
    BT.z = round(BT.z);
    BT *= step;
            
    isTop = 0;
    color=(vfrontColor[0]+vfrontColor[1]+vfrontColor[2])/3;
    
    
    //Frontal
    vec3 N=normalMatrix*vec3(0, 0, 1);
    pintaCara(true,true,true,BT,N);
    pintaCara(true,false,true,BT,N);
    pintaCara(false,true,true,BT,N);
    pintaCara(false,false,true,BT,N);
    EndPrimitive();
    //Darrera
    N=normalMatrix*vec3(0, 0, -1);
    pintaCara(true,true,false,BT,N);
    pintaCara(true,false,false,BT,N);
    pintaCara(false,true,false,BT,N);
    pintaCara(false,false,false,BT,N);
    EndPrimitive();

    //Dreta
    N=normalMatrix*vec3(1, 0, 0);
    pintaCara(true,true,true,BT,N);
    pintaCara(true,true,false,BT,N);
    pintaCara(true,false,true,BT,N);
    pintaCara(true,false,false,BT,N);
    EndPrimitive();

    //Esquerra
    N=normalMatrix*vec3(-1, 0, 0);
    pintaCara(false,true,true,BT,N);
    pintaCara(false,true,false,BT,N);
    pintaCara(false,false,true,BT,N);
    pintaCara(false,false,false,BT,N); 
    EndPrimitive();  
    
    
    //Down
    N=normalMatrix*vec3(0, -1, 0);
    pintaCara(true,false,true,BT,N);
    pintaCara(true,false,false,BT,N);
    pintaCara(false,false,true,BT,N);
    pintaCara(false,false,false,BT,N); 
    EndPrimitive(); 
    
    isTop = 1;
    //Up
    N=normalMatrix*vec3(0, 1, 0);
    pintaCara(true,true,true,BT,N);
    pintaCara(true,true,false,BT,N);
    pintaCara(false,true,true,BT,N);
    pintaCara(false,true,false,BT,N);   
    EndPrimitive();
   
}

