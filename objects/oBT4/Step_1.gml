/// @description Set Updatees

if(room == in_room) {

	#region Updates
		
		// Outdoor?
		env.outdoor = t
		env.shelter = t
		
		// Cover
		cov.sprite_index = forestCover
		cov.left_ava  = f
		cov.right_ava = f
		cov.image_blend = make_color_rgb(0,20,0)

		#region BG
		
			set.spr = [sprite_get_width(sprite_index),sprite_get_height(sprite_index)]
			set.scl = M.hRef/set.spr[1]
			set.dlt = [((set.spr[0]*set.scl)-ww)*-M.mx_pct,((set.spr[1]*set.scl)-wh)*-M.my_pct]
			set.dlt_mx = [((set.spr[0]*set.scl)-ww)*-1,((set.spr[1]*set.scl)-wh)*-1]
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
	
		#region Nodes
			
			// Next (n0)
			with(set.node.n0) {
				
				xx = parent.set.off[0]
				yy = parent.set.off[1]
				
			}
		
			// Back (n1)
			with(set.node.n1) {
			
				xx = parent.set.w*xpct
				yy = parent.set.h*ypct
				
			}
		
		#endregion

		#region Entities
		
			// None
		
		#endregion
	
	#endregion

}