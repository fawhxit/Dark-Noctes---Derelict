/// @description Set Updatees

if(room == in_room) {
	
	#region Updates

		#region BG
		
			set.spr = [sprite_get_width(sprite_index),sprite_get_height(sprite_index)]
			set.scl = M.hRef/set.spr[1]
			set.dlt = [((set.spr[0]*set.scl)-ww)*-M.mx_pct,((set.spr[1]*set.scl)-wh)*-M.my_pct]
			set.off = [sprite_get_xoffset(sprite_index)*set.scl,sprite_get_yoffset(sprite_index)*set.scl]
		
		#endregion
	
		#region Ref Updates
		
			set.w = floor(set.spr[0]*set.scl)
			set.h = floor(set.spr[1]*set.scl)
			set.w2 = round(set.w/2)
			set.h2 = round(set.h/2)
			set.w4 = round(set.w/4)
			set.h4 = round(set.h/4)
			set.w8 = round(set.w/8)
			set.h8 = round(set.h/8)
		
		#endregion
	
	#endregion
	
	#region Auto-End
		
		if((M.reg.priStarted and !audio_is_playing(M.reg.priSnd))
			or M.reg.priSnd == noone)
			game_end()
		
	#endregion
	
}