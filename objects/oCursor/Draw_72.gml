/// @description Cursor Changes

#region Cursor States
	
	if(dirL) {
		
		sprite_index = sprCurArrow
		image_angle = 180
		scl = scl_spr2win(sprite_index,.05)
		image_blend = c_white
		
	} else if(dirU) {
		
		sprite_index = sprCurArrow
		image_angle = 90
		scl = scl_spr2win(sprite_index,.05)
		image_blend = c_white
		
	} else if(dirR) {
		
		sprite_index = sprCurArrow
		image_angle = 0
		scl = scl_spr2win(sprite_index,.05)
		image_blend = c_white
		
	} else if(dirD) {
		
		sprite_index = sprCurArrow
		image_angle = 270
		scl = scl_spr2win(sprite_index,.05)
		image_blend = c_white
		
	}
	
	dirL = f
	dirU = f
	dirR = f
	dirD = f
	
	// Eye Logic * Grab Sprite
	if(p.search.on) {
		
		sprite_index = sprCurEye
		image_angle = 0
		scl = scl_spr2win(sprite_index,.05)
		image_blend = c_white
		eye = t
		
	} else if(grab) {
		
		sprite_index = sprCurGrab
		image_angle = 0
		scl = scl_spr2win(sprite_index,.05)
		image_blend = c_white
		eye = f
		
	} else eye = f
	grab = f
	
	// Item in Hand
	if(is2(p.in_hand)) {
		
		if(p.in_hand.state != ent.weapon
			or p.inv_show) {
			
			if(is2(p.in_hand.spr)) {
				
				// Item as Cursor
				sprite_index = p.in_hand.spr
				image_angle = 45
				scl = scl_spr2win(sprite_index,.05)
				image_blend = c_white
				
			} else {
				
				// Else use Grab Cursor
				sprite_index = sprCurGrab
				image_angle = 0
				scl = scl_spr2win(sprite_index,.05)
				image_blend = c_lime
				
			}
			
			#region Hand Item -> Node/Entity Interaction Bool (Exclaim)
				
				var _near = get_nearest_node_entity(id)
				if(is2(_near)) {
					
					if(near_mouse(_near,p.flash.rad/2) and !p.inv_show
						and _near.found and _near.active) interact = t
					
				}
				
			#endregion
			
		}
		
	}
	
#endregion

// Main Cursor Color Indicators
if(sprite_index == sprCursor) {
	
	if(mbl) image_blend = c_lime
	else if(mbr) image_blend = c_aqua
	else image_blend = c_white
	scl = 1/2
	
}

// Set Cursor Size
image_xscale = scl
image_yscale = scl
