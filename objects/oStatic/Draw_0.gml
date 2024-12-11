/// @description Draw It

if(parent != noone and parent.active) {
	
	#region Size Init
		
		if(!size_init and static_size == st_type.big) {
			
			size_init = t
			if(image_xscale < 0) image_xscale = random_range(bScl_mn,bScl_mx)*(image_xscale)
			else image_xscale = random_range(bScl_mn,bScl_mx)*(image_xscale)
			image_yscale = abs(image_xscale)
			xx = xx*(rel_pct*0.8)
			
		} else if(!size_init and static_size == st_type.medium) {
			
			size_init = t
			if(image_xscale < 0) image_xscale = random_range(mScl_mn,mScl_mx)*(image_xscale)
			else image_xscale = random_range(mScl_mn,mScl_mx)*(image_xscale)
			image_yscale = abs(image_xscale)
			xx = xx*(rel_pct*0.8)
			
		} else if(!size_init and static_size == st_type.small) {
			
			size_init = t
			if(image_xscale < 0) image_xscale = random_range(sScl_mn,sScl_mx)*(image_xscale)
			else image_xscale = random_range(sScl_mn,sScl_mx)*(image_xscale)
			image_yscale = abs(image_xscale)
			xx = xx*(rel_pct*0.8)
			
		}
		
	#endregion
	
	#region Init Draw
		
		if(cov.pct <= 0) {
			
			x = s.set.dlt[0]+xx
			y = s.set.dlt[1]+yy
			
		} else {
			
			if(cov.left or cov.last_cover == verb.hide_left)
				x = (s.set.dlt[0]*(1-(0.75*cov.pct)))+xx
			else if(cov.right or cov.last_cover == verb.hide_right)
				x = ((s.set.dlt[0]*(1-(0.75*cov.pct)))+s.set.dlt_mx[0]*(0.75*cov.pct))+xx
			y = ((s.set.dlt[1]*(1-(0.75*cov.pct)))+(s.set.dlt_mx[1]*(0.75*cov.pct)))+yy
			
		}
		
		/* OUTDATTED
		
		if(cov.pct <= 0) {
			
			x = (s.set.dlt[0]*((2*rel_pct)-1))+xx
			y = s.set.dlt[1]+yy
			
		} else {
			
			if(cov.left or cov.last_cover == verb.hide_left)
				x = (s.set.dlt[0]*(1-(0.75*cov.pct)))+xx
			else if(cov.right or cov.last_cover == verb.hide_right)
				x = ((s.set.dlt[0]*(1-(0.75*cov.pct)))+s.set.dlt_mx[0]*(0.75*cov.pct))+xx
			y = ((s.set.dlt[1]*(1-(0.75*cov.pct)))+(s.set.dlt_mx[1]*(0.75*cov.pct)))+yy
			
		}
		
		*/
		
	#endregion
	
	#region Fore Effects
		
		// Init
		var pct = p.fore.pct
		var zi = p.fore.zi(p.fore.zmn,p.fore.zmx,pct)
		
		iso(parent,oLane) {
			
			
			
		}
		
	#endregion
	
	if(parent.active) {
		
		// Init Bounds to Check
		bounds = [x-(sprite_xoffset*image_xscale),y-(sprite_yoffset*image_yscale),
			x+(sprite_xoffset*image_xscale),y+(sprite_yoffset*image_yscale)]
		
		// Draw Base
		draw_self()
		
		if(point_in_rectangle(wmx,wmy,bounds[0],bounds[1],
			bounds[2],bounds[3]) <= p.flash.rad
			and p.flash.on) {
			
			// Init Dark Surface
			if(!surface_exists(liteSurf))
				liteSurf = surface_create(ww,wh)
			surface_set_target(liteSurf)
			
			// Update Blend based on Depth
			if(r == noone and g == noone and b == noone) {
				
				var pct = rel_factor_pct
				r =   color_get_red(image_blend)*pct
				g = color_get_green(image_blend)*pct
				b =  color_get_blue(image_blend)*pct
				image_blend = make_color_rgb(r,g,b)
				
			}
			
			// Draw Base... Again?
			image_alpha*=.5
			draw_self()
			image_alpha*=2
			
			// Color from Flashlight
			gpu_set_colorwriteenable(t,t,t,f)
			draw_sprite_ext(sprFlash,0,wmx,wmy,p.flash.scl,p.flash.scl,0,image_blend,p.flash.a)
			gpu_set_colorwriteenable(t,t,t,t)
			
			// Reset Surface and Draw
			surface_reset_target()
			draw_set_alpha(1)
			draw_surface(liteSurf,0,0)
			
		}
	
	}
	
}