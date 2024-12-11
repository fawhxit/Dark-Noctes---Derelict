/// @description Cursor Change
if(in_room == room and ((active and (p.flash.on or p.flash.disable)
	and near_mouse(self,p.flash.rad)) or always_show) and cov.pct <= 0) {
	
	if(spr != noone) {
		
		// Init
		// cos(degtorad(sprRot))* -sin(degtorad(sprRot))*
		var scl = scl_spr2win(spr,0.1)
			var sprwh = [((sprite_get_width(spr)*scl)/2),((sprite_get_height(spr)*scl)/2)]
			var _r = sprwh[0]
			if(_r < sprwh[1]) _r = sprwh[1]
		
		if(mouse_in_circle([x,y],_r) and !p.inv_show
			and p.in_hand == noone and found) {
			
			// Set Grab Cursor
			M.m.grab = t
			
			// Set Dif?
			if(setDif != noone) M.monDif = setDif
			
		}
		
	} else {
		
		if(mouse_in_rectangle([x-50,y-50,x+50,y+50]) and !p.inv_show
			and p.in_hand == noone and found) {
			
			// Set Grab Cursor
			M.m.grab = t
			
			// Set Dif?
			if(setDif != noone) M.monDif = setDif
			
		}
		
	}
	
}