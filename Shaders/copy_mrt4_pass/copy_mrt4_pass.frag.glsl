#version 450

uniform sampler2D tex0;
uniform sampler2D tex1;
uniform sampler2D tex2;
uniform sampler2D tex3;

in vec2 texCoord;
out vec4 fragColor[4];

void main() {
	fragColor[0] = texture(tex0, texCoord);
	fragColor[1] = texture(tex1, texCoord);
	fragColor[2] = texture(tex2, texCoord);
	fragColor[3] = texture(tex3, texCoord);
}
