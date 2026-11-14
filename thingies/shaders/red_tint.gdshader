shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture;
uniform float sanity_value : hint_range(0.0, 1.0);


void fragment() {
	float redness_amount = sanity_value * 0.4;
	
    vec4 screen_color = texture(SCREEN_TEXTURE, SCREEN_UV);
    
    vec3 red_shift = screen_color.rgb * vec3(1.3, 0.9, 0.9);
    
    vec3 final_color = mix(screen_color.rgb, red_shift, redness_amount);
    
    COLOR = vec4(final_color, screen_color.a);
}