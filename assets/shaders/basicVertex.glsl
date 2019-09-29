#version 150 core

in vec3 position;
in vec4 color;
in vec2 texCoord;

out vec4 Color;
out vec2 TexCoord;

uniform mat4 transformationMatrix;
uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;

void main() {
    gl_Position = projectionMatrix * 
                  viewMatrix * 
                  transformationMatrix * 
                  vec4(position, 1.0); 

    Color = color;
    TexCoord = texCoord;    
}