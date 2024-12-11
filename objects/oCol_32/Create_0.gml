/// @description Init Room

// Basic Inits
in_room = room
s = id
first = t

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
		
		/* TODO
		start : {
				
			// Init
			nxti : noone,
			done : f,
		
			// Forest 0 (Intro)
			#region str0
		
				str0 : "'Tab' for Inventory"
					+"\n'Right Click' w/ item in hand to drop (In Inventory screen)"
					+"\n(Right clicking outside of inventory with item will return it"
					+"\nto inventory or drop it if your inventory doesn't have space)"
					+"\n'F' for Flashlight"
					+"\n'Right Click' with empty hand to Search (With a light source)"
					+"\n'Left Click' to Interact"
					+"\n'A, S and D' to hide"
					+"\n"
					+"\nPress 'Enter' to continue/dismiss dialogue.",
		
			#endregion
		
			#region str1
			
				str1 : "Search thoroughly, No more help is available to you."
			
			#endregion
				
		},
		*/
	
		node : {
				
			n0: init_node([ww2,wh2],"To Dormitory",verb2.move,rCol_32,rCol_34,self), // UPDATE ME
			n1: init_node([ww2,wh2],"To Industrial Bypass",verb2.move,rCol_32,rCol_22,self),  // UPDATE ME
			n2: init_node([ww2,wh2],"To Market",verb2.move,rCol_32,rCol_30,self)  // UPDATE ME
				
		},
	
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
	
	}
	
	
	// To Forest (n1)
	with(set.node.n1) {
		
		dynamic = t
		xrng = [0.33,0.67]
		yrng = [0.94,0.96]
		xpct = random_range(xrng[0],xrng[1])
		ypct = random_range(yrng[0],yrng[1])
		xx = parent.set.w*xpct
		yy = parent.set.h*ypct
		active = t
		gui_draw = t
	
	}
	
	// To Lounge & Recreation (n2)
	with(set.node.n2) {
		
		dynamic = t
		xrng = [0.20,0.25]
		yrng = [0.40,0.60]
		xpct = random_range(xrng[0],xrng[1])
		ypct = random_range(yrng[0],yrng[1])
		xx = parent.set.w*xpct
		yy = parent.set.h*ypct
		active = t
		gui_draw = t
	
	}
	
#endregion

#region Entity Updatees
	
#endregion

#region Always Show Nodes/Entities Logic
	
	with(set.node) {
		
		n0.always_show = t
		n1.always_show = t
		n2.always_show = t
		//n3.always_show = t
		
	}
	
	/*
	with(set.entity) {
		
		e0.always_show = t
		
	}
	*/
	
#endregion