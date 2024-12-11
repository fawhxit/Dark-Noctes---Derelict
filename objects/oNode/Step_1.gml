/// @description Change Cursor

if(in_room == room and ((active and (p.flash.on or p.flash.disable)
	and near_mouse(self,p.flash.rad)) or always_show) and cov.pct <= 0) {
	
	if(mouse_in_rectangle([x-50,y-50,x+50,y+50]) and found and fd == 0 and !p.inv_show) {
	
		// Set Cur Dir Arrow
		if(xx < ww*.15) M.m.dirL = t
		if(xx > ww*.85) M.m.dirR = t
		if(xx > ww*.15 and xx < ww*.85
			and yy > wh*.15 and yy < wh*.85)
			M.m.dirU = t
		if(yy > wh*.85) M.m.dirD = t
	
	}
	
}
