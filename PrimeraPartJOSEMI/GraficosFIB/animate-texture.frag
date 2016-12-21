#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D colorMap;
uniform float speed=0.1;
uniform float time;

void main()
{
    fragColor = frontColor * texture(colorMap, vtexCoord+speed*time);
}
