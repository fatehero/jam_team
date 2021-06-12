shader_type canvas_item;
//render_mode blend_add;
uniform sampler2D pic : hint_white;
uniform vec4 color1 : hint_color = vec4(1,1,1,0);
uniform vec4 slct : hint_color = vec4(1);
uniform vec4 color2 : hint_color = vec4(1,1,1,0);
uniform vec4 slct2 : hint_color = vec4(1);
uniform float line_thickness : hint_range(0, 10) = 1.0;
uniform vec4 ratio:hint_color =vec4(0,0,0,1);
uniform float modifi:hint_range(0, 1.0) = 1.0;
uniform vec4 range:hint_color=vec4(0,0,0,1);
uniform float modifi2:hint_range(0, 1.0) = 1.0;
uniform vec4 range2:hint_color=vec4(0,0,0,1);

void fragment() {
	vec4 color = texture(TEXTURE, UV);
	COLOR=color;
	if (abs(color.g-slct.g)<=range.g&& color.a>0.5){
		if (abs(color.r-slct.r)<=range.r){
			if (abs(color.b-slct.b)<=range.b){
		vec4 col=color1;
			
		col.r+=(ratio.r*abs(sin(TIME*3.0)));
		col.b+=(ratio.b*abs(sin(TIME*3.0)));
		col.g+=(ratio.g*abs(sin(TIME*3.0)));
		col.a=1.0;
//		vec4 back=texture(pic,vec2(UV.x+0.01,UV.y+0.01));
		COLOR=color*col;
		color=mix(color,col,color1.a);
	}
		
		
	}
		
	}
	if (abs(color.g-slct2.g)<=range2.g){
		if (abs(color.r-slct2.r)<=range2.r){
			if (abs(color.b-slct2.b)<=range2.b){

		color=mix(color,color2,color2.a);
	}


	}

	}
	
	COLOR=color;
	
//	vec2 size = TEXTURE_PIXEL_SIZE * line_thickness / 2.0;
//
//	float l = texture(TEXTURE, UV + vec2(-size.x, 0)).a;
//	float u = texture(TEXTURE, UV + vec2(0, size.y)).a;
//	float r = texture(TEXTURE, UV + vec2(size.x, 0)).a;
//	float d = texture(TEXTURE, UV + vec2(0, -size.y)).a;
//	float lu = texture(TEXTURE, UV + vec2(-size.x, size.y)).a;
//	float ru = texture(TEXTURE, UV + vec2(size.x, size.y)).a;
//	float ld = texture(TEXTURE, UV + vec2(-size.x, -size.y)).a;
//	float rd = texture(TEXTURE, UV + vec2(size.x, -size.y)).a;
//
//	vec4 color = texture(TEXTURE, UV);
//	float outline = min(1.0, l+r+u+d+lu+ru+ld+rd) - color.a;
//	float inline = (1.0 - l * r * u * d * lu * ru * rd * ld) * color.a;
//
//	vec4 outlined_result = mix(color, line_color, outline + inline);
//	COLOR = mix(color, outlined_result, outlined_result.a);
}
