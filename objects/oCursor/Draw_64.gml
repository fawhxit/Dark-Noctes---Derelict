/// @description Update/Draw Cursor

// Base Draw
x = wmx
y = wmy

#region Other Draw Changes Before Draw

if(sprite_index != sprCursor) {
	
	if(mbl) image_alpha = 1/3
	else image_alpha = 1
	
} else image_alpha = 1

#endregion Other Draw Changes Before Draw

draw_self()

#region Draw Interaction Exclaim
	
	if(interact and !p.inv_show) {
		
		var _scl = scl_spr2spr(sprExclaim,sprite_index,scl,1)
		draw_sprite_ext(sprExclaim,0,x,y,_scl,_scl,0,c_white,image_alpha)
		
	}
	
#endregion

#region Item Name in Hand
	
	try {
	
		if(p.in_hand != noone and !is2(p.in_hand.spr)) {
		
			// Draw what's in hand
			draw_set_hvalign([fa_center,fa_middle])
			draw_text_ext_color(x,y,p.in_hand.str,strH,200,
				c_white,c_white,c_ltgray,c_ltgray,1)
		
		}
	
	} catch(_ex) {
		
		show_debug_message(_ex)
		
	}
	
#endregion

// Reset Cursor
sprite_index = sprCursor
scl = 1
interact = f