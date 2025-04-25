#version 460 core
#include <flutter/runtime_effect.glsl>

// Uniforms
uniform vec2 uResolution;       // Canvas size in pixels
uniform float uTime;            // Time for animation
uniform float uStarDensity;     // Density of stars (0.0 to 1.0)
uniform float uStarSize;        // Base size of stars in pixels (e.g., 1.5)
uniform float uGridScale;       // Controls the spacing grid size (e.g., 50.0)
uniform float uTwinkleIntensity; // Controls the magnitude of brightness fluctuation (0.0 = none, 1.0 = standard)

// Output color
out vec4 fragColor;

// --- Improved Hash Function ---
vec2 hash(vec2 p) {
    p = vec2(dot(p, vec2(127.1, 311.7)), dot(p, vec2(269.5, 183.3)));
    return fract(sin(p) * 43758.5453123); // Range [0, 1]
}

// --- Star rendering function ---
float renderStar(vec2 uv, vec2 starPos, float starSizePixels) {
    float starRadiusUV = starSizePixels / uResolution.y;
    float dist = distance(uv, starPos);
    return smoothstep(starRadiusUV, starRadiusUV * 0.5, dist);
}


void main() {
    // 1. Calculate Normalized Coordinates (UV)
    vec2 uv = FlutterFragCoord().xy / uResolution;

    // 2. Determine Grid Cell
    vec2 gridUV = uv * uGridScale;
    ivec2 cell = ivec2(floor(gridUV));

    // 3. Generate Potential Star in this Cell
    vec2 cellHash = hash(vec2(cell));
    float starExistence = cellHash.x;

    if (starExistence < uStarDensity) {

        // 4. Calculate Star Properties if it Exists
        vec2 offsetInCell = vec2(cellHash.y, hash(vec2(cell) + vec2(1.23, 4.56)).x);
        vec2 starPos = (vec2(cell) + offsetInCell) / uGridScale;

        // --- Star Brightness/Size Variation ---
        float sizeVariation = hash(vec2(cell) + vec2(7.89, 0.12)).x;
        float currentStarSize = uStarSize * (0.5 + sizeVariation * 1.0);

        // --- Twinkling ---
        // Base random value for twinkling for this star over time
        float twinkleRandom = hash(vec2(cell) + uTime * 0.1).x; // Value between 0.0 and 1.0

        // Calculate the brightness offset based on the random value and intensity
        // (twinkleRandom - 0.5) gives a range of -0.5 to +0.5
        // Multiply by a base magnitude (e.g., 0.5 for +/- 25% intensity) and the user-controlled intensity
        float baseTwinkleMagnitude = 0.5; // Determines max potential twinkle range at intensity 1.0
        float twinkleOffset = (twinkleRandom - 0.5) * baseTwinkleMagnitude * uTwinkleIntensity;

        // Apply the twinkle: base brightness 1.0 + offset
        float twinkleMultiplier = 1.0 + twinkleOffset;

        // Optional: Clamp to prevent negative brightness if intensity is very high
        twinkleMultiplier = max(0.0, twinkleMultiplier);

        // --- Color Variation ---
        float colorRnd = hash(vec2(cell) + vec2(3.45, 6.78)).x;
        vec3 starColor = vec3(1.0);
        if (colorRnd > 0.75) {
            starColor = vec3(0.8, 0.85, 1.0);
        } else if (colorRnd < 0.25) {
            starColor = vec3(1.0, 0.95, 0.8);
        }

        // 5. Render the Star
        float starIntensity = renderStar(uv, starPos, currentStarSize);

        // --- Final Color ---
        // Apply the twinkle multiplier to the final star color
        vec3 finalColor = starIntensity * starColor * twinkleMultiplier;
        fragColor = vec4(finalColor, 1.0);

    } else {
        // No star
        fragColor = vec4(0.0, 0.0, 0.0, 1.0);
    }
}
