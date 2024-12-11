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
		dlt_mx	: noone,
		off : noone,
		
		// Dialogue 0: Quarry Intro
		dia0 : {
				
			// Init
			nxti : noone,
			done : f,
		
			// Forest 0 (Intro)
			#region str0
		
				str0 : "The road leaving the colony is rough and ill-maintained."
					+"\nCoarse chunks of road fall into debris filled potholes"
					+"\nwhere a mix of wet mud and old pools of oil make traction"
					+"\nimpossible."
					+"\n"
					+"\nAbandoned and ruined utility drones lie in mechanical waste"
					+"\nalong the road, obstructing the terrain further."
					+"\nMost drones rusted or dismanteled and many outfitted with"
					+"\nbroken utility accessories, grinders, drills, augers and"
					+"\nand heavy duty docking ports."
					+"\n"
					+"\nAfter a long while trudging down the road you pass a"
					+"\nflickering info beacon transmitting the following"
					+"\nmessage:"
					+"\n"
					+"\n\"3.3-3.3-R.3-MIC-NOSTRUM-SITE:QUARRY-01:INOP:DISTRESS:THREAT:LO-\""
					+"\n"
					+"\nFollowed by a short static signal before looping back"
					+"\nto the beginning again, indefinetly."
		
			#endregion
				
		},
	
		node : {
				
			n0: init_node([ww2,wh2],"To Quarry Entrance",verb2.move,rQua0,rQua1,self), 
			n1: init_node([ww2,wh2],"Road back to Colony",verb2.move,rQua0,rCol_00,self)  
				
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
	
	// Back (n1)
	with(set.node.n1) {
	
		dynamic = t
		xrng = [0.20,0.40]
		yrng = [0.94,0.96]
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