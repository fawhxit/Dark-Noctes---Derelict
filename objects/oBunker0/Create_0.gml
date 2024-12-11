/// @description Init Room

// Basic Inits
in_room = room
s = id
M.monDif += 1

// Section Discovery
var dis = instance_create_layer(0,0,"Prompt",oDiscover)
dis.stStr = "The Bunker"

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
		dlt_mx : noone,
		off : noone,
	
		node : {
				
			n0: init_node([ww2,wh2],"Further Hallway",verb2.move,in_room,rBunker1,self), // UPDATE ME
			n1: init_node([ww2,wh2],"Closed Blastdoor",verb2.none,in_room,noone,self)  // UPDATE ME
				
		},
	
		entity : {
		
			// e0: init_entity([ww2,wh2],"UPDATE ME",ent.normal,in_room,self) // UPDATE ME
		
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
	
	// Next (n0)
	with(set.node.n0) {
		
		xx = parent.set.off[0]
		yy = parent.set.off[1]
		footSFX = footEcho
	
	}
	
	// Back (n1)
	with(set.node.n1) {
	
		dynamic = t
		xrng = [0.25,0.30]
		yrng = [0.4,0.6]
		xpct = random_range(xrng[0],xrng[1])
		ypct = random_range(yrng[0],yrng[1])
		xx = parent.set.w*xpct
		yy = parent.set.h*ypct
		active = t
		gui_draw = t
	
	}
	
#endregion

#region Entity Updatees
	
	/*
	with(set.entity.e0) {
	
		xrng = [(set.off[0]-set.w8)/set.w,
				(set.off[0]+set.w8)/set.w]
		yrng = [(set.off[1]+set.h8)/set.h,
				(set.h-set.h8)/set.h]
		xpct = random_range(xrng[0],xrng[1])
		ypct = random_range(yrng[0],yrng[1])
		xx = set.w*xpct
		yy = set.h*ypct
		key_num = 0
	
	}
	*/
	
#endregion