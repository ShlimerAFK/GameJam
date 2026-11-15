shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture;
uniform float sanity_value : hint_range(0.0, 1.0);

float random_noise(vec2 uv) {
    return fract(sin(dot(uv, vec2(12.9898, 78.233))) * 43758.5453) - 0.5;
}

void fragment() {
	float glitch_amount = sanity_value;
	glitch_amount = smoothstep(0.6, 1.0, glitch_amount)  * 0.04;
	
	vec2 uv = SCREEN_UV;
	
	float strip = floor(uv.y * 18.0);
	float shift_time = floor(TIME * 12.0);
	float raw_shift = random_noise(vec2(strip, shift_time));
	float shift = step((0.49 - glitch_amount), abs(raw_shift)) * raw_shift * glitch_amount;
	
	float burst_time = floor(TIME * 4.0);
	float burst_effect = random_noise(vec2(burst_time, 1.0));
	burst_effect = step(0.45 - glitch_amount, burst_effect);
	
	shift *= burst_effect;
	
	uv.x += shift;
    
	uv = clamp(uv, vec2(0,0), vec2(1.0));
	vec4 final_color = texture(SCREEN_TEXTURE, uv);
	
    COLOR = vec4(final_color);
}