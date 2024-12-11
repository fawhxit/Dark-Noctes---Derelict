/// @description Init Room

// Basic Inits
in_room = room
s = id

#region Lane Init
	
	lane = instance_create_layer(0,0,"Environment",oLane)
	lane.outdoor = t
	lane.in_room = in_room
	lane.bg_mx = 0
	
#endregion

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
				
			n0: init_node([ww2,wh2],"Enter Power Plant",verb2.move,in_room,rPowerPlant0,self), // UPDATE ME
			n1: init_node([ww2,wh2],"Back",verb2.move,in_room,rCourtyard6,self),  // UPDATE ME
				
		},
	
		entity : {}
	
	}
	
	if(M.gvs.warehouseCard == 3) {
		
		set.entity.e0 = init_entity([ww2,wh2],"Dark Green Keycard",ent.normal,in_room,self)
		
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
		
		xrng = [0.33,0.33]
		yrng = [0.57,0.57]
		xpct = random_range(xrng[0],xrng[1])
		ypct = random_range(yrng[0],yrng[1])
		xx = parent.set.w*xpct
		yy = parent.set.h*ypct
		footSFX = footDirty
		lock_num = 3
	
	}
	
	// Back (n1)
	with(set.node.n1) {
	
		dynamic = t
		xrng = [1/3,2/3]
		yrng = [0.94,0.96]
		xpct = random_range(xrng[0],xrng[1])
		ypct = random_range(yrng[0],yrng[1])
		xx = parent.set.w*xpct
		yy = parent.set.h*ypct
		active = t
		gui_draw = t
		footSFX = footDirty
	
	}
	
#endregion

#region Entity Updatees
	
	if(M.gvs.warehouseCard == 3) {
		
		with(set.entity.e0) {
			
			xrng = [1/3,2/3]
			yrng = [2/3,0.95]
			xpct = random_range(xrng[0],xrng[1])
			ypct = random_range(yrng[0],yrng[1])
			xx = parent.set.w*xpct
			yy = parent.set.h*ypct
			key_num = 2
			spr = sprCardWarehouse
			sprRot = random(360)
			
		}
		
	}
	
#endregion

#region Keypad FX
	
	eFX = instance_create_layer(0,0,"fgc0",oFX)
	eFX.parent = id
	eFX.active = t
	eFX.in_room = rCourtyard8
	
	// Basic
	eFX.xrng[0] = 0.33
	eFX.yrng[0] = 0.56
	eFX.xrng[1] = eFX.xrng[0]
	eFX.yrng[1] = eFX.yrng[0]
    eFX.xpct = random_range(eFX.xrng[0],eFX.xrng[1])
    eFX.ypct = random_range(eFX.yrng[0],eFX.yrng[1])
	
	// Light
	eFX.lt_active = t
	eFX.ltr = 20
	eFX.lta = 1
	eFX.ltc[0] = c.ly
	eFX.ltco = eFX.ltc
	eFX.ltfx = FX.STATIC
	
	// Glow
	eFX.gl_active = t
	eFX.glrm = 6
	
	// Interaction Parent
	eFX.parentNode = set.node.n0
	
#endregion