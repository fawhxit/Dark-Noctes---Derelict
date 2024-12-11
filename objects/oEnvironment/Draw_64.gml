/// @description Lightening Flashes

if(light_leni != noone and room != rMenu) {
	
	if(light_a > .75 and flip()) {
		
		if(!light_sfx_done) {
			
			var time = irandom_range(Gspd/8,Gspd*3)
			light_sfx_g = clamp((time-(Gspd/12))/((Gspd*3)-(Gspd/12))
							,0.01,1.0)
			alarm[0] = time
			light_sfx_done = t
			
		}
 		draw_set_alpha(lerp(light_a,1.0,0.8))
		draw_rectangle_color(0,0,ww,wh,
			light_c,light_c,light_c,light_c,f)
		
	}
	
} else light_sfx_done = f