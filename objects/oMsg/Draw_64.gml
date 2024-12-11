/// @description Draw Message

if(fadeAway) {
	
	if(a <= 0) instance_destroy(id)
	else a -= ai
	
}

if(str != "") {
	
	#region Actual Draw
		
		strw = string_width(str)
		draw_set_font(fMain)
		draw_set_hvalign([fa_center,fa_middle])
		strx = ww-((strw/2)+strW)
		stry = wh-(strH)
		draw_text_ext_transformed_color(strx,stry,str,strH,strw,1,1,0,
			c.wht,c.wht,c.lgry,c.lgry,a)
		
	#endregion
	
	#region Fadeaway Triggers
		
		if(trgEnd != noone) {
			
			if(trgEnd == mb_left or trgEnd == mb_right) {
				
				#region MB Triggers
					
					if(a >= 2/3) {
						
						if(mblp) fadeAway = t
						else if(mbrp) fadeAway = t
						
					} else {
						
						if(mblp) earlyTrg = t
						else if(mbrp) earlyTrg = t
						
					}
					
				#endregion
				
			} else if(is_string(trgEnd)) {
				
				#region Ord Triggers
					
					if(a >= 2/3) {
						
						if(keyboard_check_pressed(ord(string_upper(trgEnd))))
							fadeAway = t
						
					} else {
						
						if(keyboard_check_pressed(ord(string_upper(trgEnd))))
							earlyTrg = t
						
					}
					
				#endregion
				
			} else if(keyboard_check_pressed(trgEnd)) {
				
				#region VK Triggers
					
					if(a >= 2/3) fadeAway = t
					else earlyTrg = t
					
				#endregion
				
			}
			
		}
		
		// Parent Done? Early Trigger...
		if(is2(par)) {
			
			if(is2(par.done))
				earlyTrg = t
			
		}
		
		// Early Triggered? Activate...
		if(earlyTrg and a >= 2/3)
			fadeAway = t
		
	#endregion Fadeaway Triggers
	
}