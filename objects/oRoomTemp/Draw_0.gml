/// @description Draw BG

/*
if(room == in_room and p.state != verb.UPDATEME) {

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
	
} else if (room == in_room and p.state == verb.UPDATEME) {
	
	switch(set.UPDATEME.nxti) {
		
		case noone: {
			
			if(M.state == game.intro)
				set.start.nxti = 0
			
			break
			
		}
				
		case 0: {
			
			if(M.prompt == noone)
				M.prompt = init_prompt([ww8,wh8,ww-ww8,wh-wh8],set.start.str0)
			else if(M.prompt.done and !M.prompt.active) {
				
				instance_destroy(M.prompt)
				M.prompt = noone
				set.start.nxti += 1
				
			}
			break
			
		}
		
		case 1: {
					
			if(M.prompt == noone)
				M.prompt = init_prompt([ww8,wh8,ww-ww8,wh-wh8],set.start.str1)
			else if(M.prompt.done and !M.prompt.active) {
				
				instance_destroy(M.prompt)
				M.prompt = noone
				set.start.nxti += 1
				p.state = verb.idle
				M.state = game.play
				env.outdoor = t
				
			}
			break
					
		}
		
	}
	
}