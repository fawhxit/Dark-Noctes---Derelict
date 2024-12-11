/// @description

if(s != noone and room != rMenu) {
	
	xx += (env.wind_delta*2)*rel_factor
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
	
	if(x > (M.wRef+(sprw*.7)) or x < -(sprw*.7))
		instance_destroy(self)
	
	draw_self()
	
}