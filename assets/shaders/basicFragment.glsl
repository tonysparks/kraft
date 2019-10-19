#version 150 core

in vec3 Normal;
in vec2 TexCoord;
in vec3 ToLight;
in vec3 ToCamera;

out vec4 outColor;

uniform sampler2D tex;
uniform vec3 lightColor;
uniform vec3 lightPos;
uniform float shineDamper;
uniform float reflectivity;

void main() {
    vec3 unitNormal = normalize(Normal);
    vec3 unitLight = normalize(ToLight);

    float nDot = dot(unitNormal, unitLight);
    float brightness = max(nDot, 0.9);
    vec3 diffuse = brightness * lightColor;

    vec3 unitCamera = normalize(ToCamera);
    vec3 lightDirection = -unitLight;
    vec3 reflectedLightDirection = reflect(lightDirection, unitNormal);

    float specularFactor = dot(reflectedLightDirection, unitCamera);
    specularFactor = max(specularFactor, 0.0);

    float dampedFactor = pow(specularFactor, shineDamper);
    vec3 finalSpecular = dampedFactor * reflectivity * lightColor;

    
    vec4 c = texture(tex, TexCoord);    
    outColor = vec4(diffuse, 1.0) * c + vec4(finalSpecular, 1.0);    
}