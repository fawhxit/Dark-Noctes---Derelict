/// @description Decay Childs

if(is_undefined(orig_depth))
	orig_depth = depth

if(ii == 0) {
	
	// Parent Fog
	x = parent.x
	y = parent.y
	image_angle += env.wind_delta/pi
	
} else {
	
	// Child Fog
	a = 1 - (a_i/a_del)
	image_alpha = a*parent.image_alpha
	
	xx += xspd
	yy += yspd
	spd_pct = parent.spd_pct*a
	
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
	x = xx+(s.set.dlt[0]*spd_pct)
	y = yy+(s.set.dlt[1]*spd_pct)
	*/
	
	depth_dlt = 5*(1-a)
	depth = orig_depth+depth_dlt
	image_xscale -= scl_rate
	image_yscale -= scl_rate
	
	a_i += 1
	
	if(a_i >= a_del) {
		
		ds_list_delete(parent.fog_L,ii)
		instance_destroy(id)
		
	}
	
}