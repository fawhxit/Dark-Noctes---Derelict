/// @description Draw BG

 if (room == in_room) {

	#region Init Draw
		
		image_blend = env.blend_current
		image_alpha = 1
		image_index = 0
		if(cov.pct <= 0) {
			
			x = set.dlt[0]+set.off[0]
			y = set.dlt[1]+set.off[1]
			
		} else {
			
			if(cov.left or cov.last_cover == verb.hide_left)
				x = (set.dlt[0]*(1-(0.75*cov.pct)))+set.off[0]
			else if(cov.right or cov.last_cover == verb.hide_right)
				x = ((set.dlt[0]*(1-(0.75*cov.pct)))+set.dlt_mx[0]*(0.75*cov.pct))+set.off[0]
			y = ((set.dlt[1]*(1-(0.75*cov.pct)))+(set.dlt_mx[1]*(0.75*cov.pct)))+set.off[1]
			
		}
		image_xscale = set.scl
		image_yscale = set.scl
		image_angle = 0
	
	#endregion
	
	#region Do Draw
		
		draw_set_alpha(1)
		draw_set_color(c_white)
		draw_self()
		
	#endregion
			
}
