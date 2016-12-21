#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
in vec3 N;
out vec4 fragColor;

uniform sampler2D window;
uniform sampler2D interior1; // observeu el digit 1 al final
uniform sampler2D exterior2; // observeu el digit 2 al final
		
		vec2 texCoordInterior1 = vtexCoord+0.5*N.xy;
		vec2 texCoordExterior2 = vtexCoord+0.7*N.xy;

    vec4 colorWindows = texture(window,vtexCoord);
		vec4 colorInterior1 = texture(interior1,texCoordInterior1);
		vec4 colorExterior2 = texture(exterior2,texCoordExterior2);

void main()
{
		

		fragColor = colorWindows;
		if (colorWindows.a < 1) {
			fragColor = colorInterior1;
			if (colorInterior1.a < 1) {
				fragColor = colorExterior2;
			}
		}
		
}
