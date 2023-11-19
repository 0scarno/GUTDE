shader_type spatial;

void fragment() {
    // Grid color and background color
    vec4 gridColor = vec4(0.0, 0.0, 0.0, 1.0); // Black grid lines
    vec4 bgColor = vec4(1.0, 1.0, 1.0, 1.0); // White background

    // Grid size
    float gridSize = 0.1; // Distance between grid lines

    // Calculate the grid pattern
    vec2 gridPattern = mod(UV / gridSize, 1.0);
    float lineThickness = 0.02; // Thickness of the grid lines

    // Determine if the current fragment is a grid line or background
    if (gridPattern.x < lineThickness || gridPattern.y < lineThickness) {
        ALBEDO = gridColor.rgb;
    } else {
        ALBEDO = bgColor.rgb;
    }
}
