shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture;
uniform float sanity_value : hint_range(0.0, 1.0);


void fragment() {
	float desaturate_amount = sanity_value * 0.5;
	
    vec4 screen_color = texture(SCREEN_TEXTURE, SCREEN_UV);
    
    // Weighted luminance: https://www.grayscaleimage.org/posts/rgb-to-grayscale-how-it-works
    float gray = dot(screen_color.rgb, vec3(0.2126, 0.7152, 0.0722));
    vec3 gray_color = vec3(gray);
    
    vec3 final_color = mix(screen_color.rgb, gray_color, desaturate_amount);
    
    COLOR = vec4(final_color, screen_color.a);
}