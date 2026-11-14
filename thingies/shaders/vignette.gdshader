shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture;
uniform float sanity_value : hint_range(0.0, 1.0);

float random_noise(vec2 uv) {
    return fract(sin(dot(uv, vec2(12.9898, 78.233))) * 43758.5453) - 0.5;
}

float wave(float intensity) {
	return intensity * ((sin(TIME * 1.7) * sin(TIME * 3.1)) * 0.5);
}

void fragment() {
	float vignette_amount = sanity_value;
	vignette_amount = smoothstep(0.3, 1.0, vignette_amount);
	vignette_amount += wave(0.02) * vignette_amount;
	
    vec4 screen_color = texture(SCREEN_TEXTURE, SCREEN_UV);
	
	float corner_distance = distance(vec2(0.5, 0.5), SCREEN_UV);
	float smooth_distance = smoothstep((0.65 + wave(0.05)), 0.2, corner_distance);
	
	vec3 vignette_effect = screen_color.rgb * smooth_distance;
    vignette_effect.rgb += random_noise(SCREEN_UV) * (1.0 / 128.0);
	
    vec3 final_color = mix(screen_color.rgb, vignette_effect, vignette_amount);
    
    COLOR = vec4(final_color, screen_color.a);
}