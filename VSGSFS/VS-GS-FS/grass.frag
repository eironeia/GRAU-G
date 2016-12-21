#version 330 core

in vec3 gNormal;
in vec4 gPos;

out vec4 fragColor;

uniform mat3 normalMatrix; 
uniform sampler2D grass_top0, grass_side1;

uniform float d = 0.1;


void main() {
  vec3 N=normalize(normalMatrix*gNormal); 
  vec2 gtexCoord; 
  vec4 TC; 
  
  
    if (gNormal.z == 0) {
      gtexCoord = vec2(4*(gPos.x - gPos.y),1.0 - gPos.z/d); 
      TC=texture2D(grass_side1, gtexCoord);
      if (TC.a < 0.1) discard;
    }
    else { // Horizontal
         gtexCoord = 4*gPos.xy; 
         TC=texture2D(grass_top0, gtexCoord);
    }
    
    fragColor = TC*N.z;
  
}
