shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture;
uniform float sanity_value : hint_range(0.0, 1.0);

float random_noise(vec2 uv) {
    return fract(sin(dot(uv, vec2(12.9898, 78.233))) * 43758.5453) - 0.5;
}

void fragment() {
    float distort_amount = sanity_value;
    distort_amount = smoothstep(0.7, 1.0, distort_amount) * 0.05;
    
    vec4 screen_color = texture(SCREEN_TEXTURE, SCREEN_UV);
	vec3 distort_effect = screen_color.rgb + random_noise(SCREEN_UV + fract(TIME));
    
    vec3 final_color = mix(screen_color.rgb, distort_effect, distort_amount);
    
    COLOR = vec4(final_color, screen_color.a);
}