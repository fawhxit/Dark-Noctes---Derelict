/// @description Init Room

// Basic Inits
in_room = room
s = id
M.state = game.finish

// Audio Wipe
audio_stop_all()
M.reg.randActive = f

// Truck Start SFX
var efx = instance_create_layer(0,0,"fgc0",oFX)
efx.playSFX = truckEngine
efx.playSFXVol = 1
efx.always = t

// End Music
M.reg.sndCenter = t
M.reg.priStarted = f
M.reg.priDel = Gspd*3
M.reg.priDeli = 0
M.reg.priLoop = f
M.reg.priSnd = msxSporkbomb

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
		off : noone,
		
		finish : {
			
			// Init
			nxti : noone,
			done : f,
			
			// Forest 0 (Intro)
			#region str0
				
				str0 : "The Nightmare is over once more.",
				str1 : "Enjoy, Sporkbomb by T"
				
			#endregion
			
		},
		
		node : {},
		
		entity : {}
		
	}
	
#endregion

#region Init Struct Updatees
	
	set.spr = [sprite_get_width(sprite_index),sprite_get_height(sprite_index)]
	set.scl = M.hRef/set.spr[1]
	set.dlt = [((set.spr[0]*set.scl)-ww)*-M.mx_pct,((set.spr[1]*set.scl)-wh)*-M.my_pct]
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