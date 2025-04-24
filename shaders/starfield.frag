#version 460 core
#include <flutter/runtime_effect.glsl>

// Uniforms (inputs from your Dart code)
uniform vec2 uResolution; // The size of the canvas/render target in pixels
uniform float uTime;      // Time, for potential animation (like twinkling)
uniform float uStarThreshold; // Threshold for star visibility (0.0 to 1.0)

// Output color for the current fragment (pixel)
out vec4 fragColor;

float hash(vec2 p) {
    p = 50.0 * fract(p * 0.3183099 + vec2(0.71, 0.113));
    return -1.0 + 2.0 * fract(p.x * p.y * (p.x + p.y));
}

void main() {
    vec2 pixelCoords = FlutterFragCoord().xy;
    // vec2 coordsForRandom = pixelCoords;
    vec2 coordsForRandom = pixelCoords / uResolution;
    float rnd = hash(coordsForRandom);

    // Calculate the effective threshold, including twinkling
    // Use the uStarThreshold uniform as the base
    float twinkleOffset = hash(coordsForRandom * uTime) * 0.005;//  sin(uTime * 1.0 + coordsForRandom.x * 0.1 + coordsForRandom.y * 0.05) * 0.004;
    float effectiveThreshold = uStarThreshold + twinkleOffset;

    // Determine star intensity based on the effective threshold
    float starIntensity = step(effectiveThreshold, rnd);

    // --- Optional: Add Color Variation ---
    float colorRnd = hash(coordsForRandom + vec2(10.0, 10.0));
    vec3 starColor = vec3(1.0); // Default white
    
    if (colorRnd > 0.6) {
        starColor = vec3(0.8, 0.8, 1.0); // Cool white / slightly blue
    } else if (colorRnd < 0.4) {
        starColor = vec3(1.0, 0.95, 0.8); // Warm white / slightly yellow
    }

    // --- Final Color ---
    vec3 finalColor = starIntensity * starColor;
    fragColor = vec4(finalColor, 1.0);
}
