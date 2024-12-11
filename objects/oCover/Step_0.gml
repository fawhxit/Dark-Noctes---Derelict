/// @description Updates

// Keys
if(!left and !right) {
	
	left  = ( keyboard_check(ord("A")) and left_ava  and sprite_index != noone and pct <= 0 )
	right = ( keyboard_check(ord("D")) and right_ava and sprite_index != noone and pct <= 0 )
	
}

if(!keyboard_check(ord("A"))) left = f
if(!keyboard_check(ord("D"))) right = f

in_cover = (left or right or pct >= 0.67)


#region BG
	
	if(sprite_index != noone) {
		
		set.spr = [sprite_get_width(sprite_index),sprite_get_height(sprite_index)]
		set.scl = M.hRef/set.spr[1]
		set.dlt = [((set.spr[0]*set.scl)-ww)*-M.mx_pct,((set.spr[1]*set.scl)-wh)*-M.my_pct]
		set.off = [sprite_get_xoffset(sprite_index)*set.scl,sprite_get_yoffset(sprite_index)*set.scl]
		
	}
	
#endregion