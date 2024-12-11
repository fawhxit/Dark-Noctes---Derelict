/// @description Init Room

// Basic Inits
in_room = room
s = id

#region Create Struct
	
	set = {
	
		w : noone,
		h : noone,
		w2 : noone,
		h2 : noone,
		w4 : noone,
		h4 : noone,
		w8 : noone,
		h8 : noone,
		spr : noone,
		scl : noone,
		dlt : noone,
		dlt_mx	: noone,
		off : noone,
	
		node : {
				
			n1: init_node([ww2,wh2],"Run",verb2.move,in_room,rLab8,self)  // UPDATE ME
				
		},
	
		entity : {
			
			e0: init_entity([ww2,wh2],"Keys",ent.normal,in_room,self)
			
		}
	
	}
	
#endregion

#region Init Struct Updatees
	
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

#region Node Updatees
	
	// Back (n1)
	with(set.node.n1) {
		
		xx = parent.set.off[0]
		yy = parent.set.off[1]
		active = t
		gui_draw = t
		snd = msxFlight
		sndLoop = t
		
	}
	
#endregion

#region Entity Updatees
		
	with(set.entity.e0) {
		
		xrng = [0.47,0.47]
		yrng = [0.63,0.63]
		xpct = random_range(xrng[0],xrng[1])
		ypct = random_range(yrng[0],yrng[1])
		xx = parent.set.w*xpct
		yy = parent.set.h*ypct
		key_num = 5
		spr = sprKeys
		sprRot = 0
		setDif = 6
		
	}
	
#endregion