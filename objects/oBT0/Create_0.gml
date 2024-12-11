/// @description Init Room

// Basic
in_room = room
s = id

#region Lane Init
	
	lane = instance_create_layer(0,0,"Environment",oLane)
	lane.outdoor = t
	lane.in_room = in_room
	
#endregion

// Debug Difficulty
if(M.dbgDif) M.monDif = 6 // Change difficulty to debug, 6 max

#region Create Struct
	
	set = {
	
		w		: noone,
		h		: noone,
		w2		: noone,
		h2		: noone,
		w4		: noone,
		h4		: noone,
		w8		: noone,
		h8		: noone,
		spr		: noone,
		scl		: noone,
		dlt		: noone,
		dlt_mx	: noone,
		off		: noone,
	
		node : {
				
			n0: init_node([ww2,wh2],"To Lake",verb2.move,rBT0,rBT1,self),
			// n1: init_node([ww2,wh2],"To Colony",verb2.move,rBT0,rCol_00,self) DISABLED
				
		},
	
		entity : {
		
			e0: init_entity([ww2,wh2],"Heavy Branch",ent.weapon,rBT0,self)
		
		}
	
	}
	
#endregion

#region Init Struct Updatees
	
	set.spr = [sprite_get_width(bgForest0),sprite_get_height(bgForest0)]
	set.scl = M.hRef/set.spr[1]
	set.dlt = [((set.spr[0]*set.scl)-ww)*-M.mx_pct,((set.spr[1]*set.scl)-wh)*-M.my_pct]
	set.dlt_mx = [((set.spr[0]*set.scl)-ww)*-1,((set.spr[1]*set.scl)-wh)*-1]
	set.off = [sprite_get_xoffset(bgForest0)*set.scl,sprite_get_yoffset(bgForest0)*set.scl]
	
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

#region Scene Init
	
	scene_inst = instance_create_layer(0,0,"Prompt",oScene)
	scene_inst.parent = id
	scene_inst.in_room = room
	scene_inst.active = t
	scene_inst.str = ["I find myself on a dark forest trail at night, shrouded by a thick and crawling, blue fog. The path snakes onward, obscured by the ever-shifting fog and darkness."
	+"\n\nEndless crowds of desolate trees stand sentinel around the trail and beyond. Their twisted forms and naked white limbs reaching out like skeletal fingers."
	,"Scents of a cold damp earth, miasma of dead foliage and forsaken critters waft into my senses with grave and melancholic perfumes."
	+"\n\nThe wind whips ice-like air through my veins."
	,"A weathered signpost, its wood aged to a dark patina by years of exposure and torment, laments of a bridge ahead."]
	scene_inst.xx = set.w2
	scene_inst.yy = set.h2
	
#endregion

/*
#region DEBUG LIGHT FX
	
	dbglt = instance_create_layer(0,0,"Nodes",oFX)
	dbglt.parent = id
	dbglt.active = t
	dbglt.in_room = rBT0
	dbglt.ltfx = FX.FLASH
    eFX.xpct = random_range(eFX.xrng[0],eFX.xrng[1])
    eFX.ypct = random_range(eFX.yrng[0],eFX.yrng[1])
	dbglt.ltc[0] = c.nr
	dbglt.lt_active = t
	dbglt.gl_active = t
	
#endregion
*/

#region Node Updatees
	
	with(set.node.n0) {
		
		// Init, Repply positioning
		xx = parent.set.off[0]
		yy = parent.set.off[1]
		can_find = t
		footSFX = footDirty
		
		if(M.dbgEnd) // BT0 -> debug
			to_room = rCourtyard5
		
	}
	
	// Back (n1)
	/* DISABLED
	with(set.node.n1) {
		
		dynamic = t
		xrng = [0.04,0.06]
		yrng = [0.50,0.80]
		xpct = random_range(xrng[0],xrng[1])
		ypct = random_range(yrng[0],yrng[1])
		xx = parent.set.w*xpct
		yy = parent.set.h*ypct
		active = t
		gui_draw = t
		
	}
	*/
	
#endregion

#region Entity Updatees
	
	if(is2(set.entity.e0)) {
		
		with(set.entity.e0) {
			
			xrng = [100/parent.set.w,
					(parent.set.off[0]-parent.set.w8)/parent.set.w]
			yrng = [(parent.set.off[1]+parent.set.h8)/parent.set.h,
					(parent.set.h-100)/parent.set.h]
			xpct = random_range(xrng[0],xrng[1])
			ypct = random_range(yrng[0],yrng[1])
			xx = parent.set.w*xpct
			yy = parent.set.h*ypct
			spr = sprBranch
			sprRot = random_range(-45,45)
			durability = 1
			
		}
		
	}
	
#endregion

#region Other Game Start Inits
	
	// Start Random Event Generator
	if(M.reg == noone)
		M.reg = instance_create_layer(0,0,"Logic",oREG)
	
#endregion