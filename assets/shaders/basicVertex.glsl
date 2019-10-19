#version 150 core

in vec3 position;
in vec3 normal;
in vec2 texCoord;

out vec3 Normal;
out vec2 TexCoord;
out vec3 ToLight;
out vec3 ToCamera;

uniform mat4 transformationMatrix;
uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;
uniform vec3 lightPos;

void main() {
    vec4 worldPosition = transformationMatrix * vec4(position, 1.0);

    gl_Position = projectionMatrix * 
                  viewMatrix * 
                  worldPosition;

    Normal = (transformationMatrix * vec4(normal, 0.0)).xyz;
    ToLight = lightPos - worldPosition.xyz;
    ToCamera = (inverse(viewMatrix) * vec4(0,0,0,1.0)).xyz - worldPosition.xyz;
    TexCoord = texCoord;    
}