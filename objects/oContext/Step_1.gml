/// @description Cursor Change

#region Set Cursor

if(in_room == room and ((active and (p.flash.on or p.flash.disable)
	and near_mouse(self,p.flash.rad)) or always_show) and cov.pct <= 0) {
	
	if(mouse_in_rectangle([x-50,y-50,x+50,y+50]) and !p.inv_show
		and p.in_hand == noone and found) {
	
		// Set Grab Cursor
		M.m.grab = t
		
		// Set Dif?
		if(setDif != noone) M.monDif = setDif
	
	}
	
}

#endregion Set Cursor