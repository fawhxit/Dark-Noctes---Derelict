/// @description Draw Cover

// Restart Delay
if((left or right) and deli == noone) {
	
	deli = 0
	audio_play_sound_at(bushRustle1,0,0,0,5,32,1,f,4,1,0,random_range(0.9,1.1))
	
}

// Iterate/Draw Cover
if(left or (last_cover == verb.hide_left and pct > 0)) {
	
	#region Left Cover
		
		// Init
		last_cover = verb.hide_left
		if(left) pct = deli/del
		var slide = (-sprite_width*set.scl)+((sprite_width*set.scl)*pct)
		draw_set_alpha(1)
		draw_set_color(c_white)
		
		// Base Sprite (Silhoutte)
		draw_sprite_ext(sprite_index,0,slide+(s.set.dlt[0]*2),s.set.h2+s.set.dlt[1],
			set.scl,set.scl,0,make_color_rgb(0,25,0),1)
		
		if(p.flash.on) {
			
			#region Flashlight Lighting
				
				// Init Dark Surface
				if(!surface_exists(liteSurf))
					liteSurf = surface_create(ww,wh)
				surface_set_target(liteSurf)
				
				// Color from Ambient Light
				image_alpha*=.5
				draw_sprite_ext(sprite_index,0,slide+(s.set.dlt[0]*2),s.set.h2+s.set.dlt[1],
					set.scl,set.scl,0,make_color_rgb(0,25,0),1)
				image_alpha*=2
				
				// Color from Flashlight
				gpu_set_colorwriteenable(t,t,t,f)
				draw_sprite_ext(sprFlash,0,wmx,wmy,p.flash.scl,p.flash.scl,
					0,make_color_rgb(0,25,0),p.flash.a)
				gpu_set_colorwriteenable(t,t,t,t)
				
				// Reset Surface and Draw
				surface_reset_target()
				draw_set_alpha(1)
				draw_surface(liteSurf,0,0)
				
			#endregion
		
		}
		
		if(deli < del and left) deli += 1
		
	#endregion
	
} else if(right or (last_cover == verb.hide_right and pct > 0)) {
	
	#region Right Cover
		
		// Init
		last_cover = verb.hide_right
		if(right) pct = deli/del
		var slide = (sprite_width*set.scl)-((sprite_width*set.scl)*pct)
		draw_set_alpha(1)
		draw_set_color(c_white)
		
		// Base Sprite (Silhoutte)
		draw_sprite_ext(sprite_index,0,(s.set.w+slide)+s.set.dlt[0],
			s.set.h2+s.set.dlt[1],set.scl,set.scl,180,make_color_rgb(0,25,0),1)
		
		if(p.flash.on) {
			
			#region Flashlight Lighting
				
				// Init Dark Surface
				if(!surface_exists(liteSurf))
					liteSurf = surface_create(ww,wh)
				surface_set_target(liteSurf)
				
				// Color from Ambient Light
				image_alpha*=.5
				draw_sprite_ext(sprite_index,0,(s.set.w+slide)+s.set.dlt[0],
					s.set.h2+s.set.dlt[1],set.scl,set.scl,180,make_color_rgb(0,25,0),1)
				image_alpha*=2
				
				// Color from Flashlight
				gpu_set_colorwriteenable(t,t,t,f)
				draw_sprite_ext(sprFlash,0,wmx,wmy,p.flash.scl,p.flash.scl,
					0,make_color_rgb(0,25,0),p.flash.a)
				gpu_set_colorwriteenable(t,t,t,t)
				
				// Reset Surface and Draw
				surface_reset_target()
				draw_set_alpha(1)
				draw_surface(liteSurf,0,0)
				
			#endregion
			
		}
		
		if(deli < del and right) deli += 1
		
	#endregion
	
}

// Deiterate Cover
if(!left and !right){
	
	deli = noone
	pct = clamp(pct-.05,0,1)

}