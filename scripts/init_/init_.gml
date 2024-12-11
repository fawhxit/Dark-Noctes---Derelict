function init_(){
	
	#region Macros
		
		#region Basic
			
			#macro t true
			#macro f false
			#macro strW string_width("_")
			#macro strH string_height("|")
			#macro Gspd game_get_speed(gamespeed_fps) // room_speed
			
		#endregion
		
		#region Runtime
			
			// Window
			#macro ww window_get_width()
			#macro wh window_get_height()
			// 1/2
			#macro ww2 round(window_get_width()/2)
			#macro wh2 round(window_get_height()/2)
			// 1/3
			#macro ww3 round(window_get_width()/3)
			#macro wh3 round(window_get_height()/3)
			// 1/4
			#macro ww4 round(window_get_width()/4)
			#macro wh4 round(window_get_height()/4)
			// 1/8
			#macro ww8 round(window_get_width()/8)
			#macro wh8 round(window_get_height()/8)
			// 1/16
			#macro ww16 round(window_get_width()/16)
			#macro wh16 round(window_get_height()/16)
			
			// Display
			#macro dw display_get_width()
			#macro dh display_get_height()
			// 1/2
			#macro dw2 round(display_get_width()/2)
			#macro dh2 round(display_get_height()/2)
			// 1/3
			#macro dw3 round(display_get_width()/3)
			#macro dh3 round(display_get_height()/3)
			// 1/4
			#macro dw4 round(display_get_width()/4)
			#macro dh4 round(display_get_height()/4)
			// 1/8
			#macro dw8 round(display_get_width()/8)
			#macro dh8 round(display_get_height()/8)
			// 1/16
			#macro dw16 round(display_get_width()/16)
			#macro dh16 round(display_get_height()/16)
			
		#endregion
		
		#region Timing
			
			// Delta Time
			#macro dt delta_time/1000000
			
			#macro fi global.frame_iter
			#macro fd global.frame_delay
			#macro fs global.frame_state
			fi = 0
			fd = 0
			fs = flip()
			#macro si global.second_iter
			#macro sd global.second_delay
			#macro ss global.second_state
			si = 0
			sd = 0
			ss = flip()
			#macro mi global.minute_iter
			#macro md global.minute_delay
			#macro ms global.minute_state
			mi = 0
			md = 0
			ms = flip()
			#macro hi global.hour_iter
			#macro hd global.hour_delay
			#macro hs global.hour_state
			hi = 0
			hd = 0
			hs = flip()
			
		#endregion
		
		#region Mouse
			
			// X/Y
			// Room
			#macro rmx mouse_x
			#macro rmy mouse_y
			#macro rmxo global.room_mouse_xOld
			rmxo = 0
			#macro rmyo global.room_mouse_yOld
			rmyo = 0
			#macro rmxd global.room_mouse_xDelta
			rmxd = 0
			#macro rmyd global.room_mouse_yDelta
			rmyd = 0
			// Window
			#macro wmx window_mouse_get_x()
			#macro wmy window_mouse_get_y()
			#macro wmxo global.window_mouse_xOld
			wmxo = 0
			#macro wmyo global.window_mouse_yOld
			wmyo = 0
			#macro wmxd global.window_mouse_xDelta
			wmxd = 0
			#macro wmyd global.window_mouse_yDelta
			wmyd = 0
			
			// Buttons
			// Left
			#macro mbl mouse_check_button(mb_left)
			#macro mblp mouse_check_button_pressed(mb_left)
			#macro mblr mouse_check_button_released(mb_left)
			// Right
			#macro mbr mouse_check_button(mb_right)
			#macro mbrp mouse_check_button_pressed(mb_right)
			#macro mbrr mouse_check_button_released(mb_right)
			// Middle
			#macro mbm mouse_check_button(mb_middle)
			#macro mbmp mouse_check_button_pressed(mb_middle)
			#macro mbmr mouse_check_button_released(mb_middle)
			// Wheel
			#macro mwu mouse_wheel_up()
			#macro mdu mouse_wheel_down()
		
		#endregion
		
		#region Keyboard
			
			// Move
			#macro kbW keyboard_check(ord("W"))
			#macro kbA keyboard_check(ord("A"))
			#macro kbS keyboard_check(ord("S"))
			#macro kbD keyboard_check(ord("D"))
			
			// Interact
			#macro kbNTRp keyboard_check_pressed(vk_enter)
			
		#endregion
		
		#region Main
			
			#macro p global.player
			#macro s global.scene
			// #macro L global.lanes
			
		#endregion
		
		#region Environment
			
			#macro env global.weather_effects
			env = instance_create_layer(0,0,"Logic",oEnvironment)
			
		#endregion
		
		#region Cover
			
			#macro cov global.cover
			cov = instance_create_layer(0,0,"Cover",oCover)
			cov.sprite_index = noone
			
		#endregion
		
		#region Instance Lists
			
			#macro FXS global.fx_struct
			FXS = {}
			
		#endregion
		
	#endregion
	
	#region Enums
		
		enum game {
			
			init,
			intro,
			play,
			pause,
			finish
			
		}
		
		enum btn {
			
			exit_game,
			play
			
		}
		
		enum verb {
			
			start,
			idle,
			hide_left,
			hide_right,
			walk,
			search,
			search2,
			prompt,
			inventory,
			use
			
		}
		
		enum verb2 {
			
			none,
			move,
			search
			
		}
		
		enum ent {
			
			normal,
			broken,
			fixed,
			weapon,
			game,
			sz
				
		}
		
		enum RES {
			
			UNKNOWN,
			ORGANIC,
			INORGANIC,
			PLANT,
			STONE,
			WOOD_LOG,
			WOOD_SCRAP
			
		}
		
		enum FX {
			
			STATIC,
			FLASH
			
		}
		
		enum ntype {
			
			none,
			contextual
			
		}
		
		enum xytype {
			
			txt,
			nod,
			ent,
			sfx,
			sz
			
		}
		
		enum xyedit {
			
			text,
			to_room,
			timer,
			delay,
			anim,
			spr,
			snd,
			ent,
			sz
			
		}
		
		enum dbgOpt {
			
			norm,
			xystruct,
			xyhelp,
			hide,
			sz
			
		}
		
		enum mon {
			
			idle,
			fast,
			far,
			close,
			chase,
			creep,
			flee,
			sz
			
		}
		
	#endregion
	
	#region Runtime
		
		window_set_size(dw,dh)
		window_set_position(0,0)
		
	#endregion
	
	#region Color Struct
		
		#macro c global.color_struct
		c = {
			
			#region Grayscale
				
				wht		:	make_color_rgb(255,255,255),
				lgry	:	make_color_rgb(192,192,192),
				gry		:	make_color_rgb(128,128,128),
				dgry	:	make_color_rgb(64,64,64),
				blk		:	make_color_rgb(0,0,0),
				
			#endregion
			
			#region Redscale
				
				nr	:	make_color_rgb(255,0,0),
				lr	:	make_color_rgb(192,0,0),
				r	:	make_color_rgb(128,0,0),
				dr	:	make_color_rgb(64,0,0),
				
			#endregion
			
			#region Greenscale
				
				ng	:	make_color_rgb(0,255,0),
				lg	:	make_color_rgb(0,192,0),
				g	:	make_color_rgb(0,128,0),
				dg	:	make_color_rgb(0,64,0),
				
			#endregion
			
			#region Bluescale
				
				nb	:	make_color_rgb(0,0,255),
				lb	:	make_color_rgb(0,0,192),
				b	:	make_color_rgb(0,0,128),
				db	:	make_color_rgb(0,0,64),
				
			#endregion
			
			#region Yellowscale
				
				ny	:	make_color_rgb(255,255,0),
				ly	:	make_color_rgb(192,192,0),
				ylw	:	make_color_rgb(128,128,0),
				dy	:	make_color_rgb(64,64,0),
				
			#endregion
			
			#region Orangescale
				
				nrng	:	make_color_rgb(255,128,0),
				lrng	:	make_color_rgb(192,96,0),
				rng		:	make_color_rgb(128,64,0),
				drng	:	make_color_rgb(64,32,0)
				
			#endregion
			
		}
		
	#endregion
	
	#region Iterator Struct
		
		#macro ITER global.iterator_struct
		ITER = {
			
			// Assuming Iterating from 0 to 1
			m30 : 1/((Gspd*Gspd)*30),
			m20 : 1/((Gspd*Gspd)*20),
			m15 : 1/((Gspd*Gspd)*15),
			m10 : 1/((Gspd*Gspd)*10),
			m5 : 1/((Gspd*Gspd)*5),
			m3 : 1/((Gspd*Gspd)*3),
			m2 : 1/((Gspd*Gspd)*2),
			m1 : 1/(Gspd*Gspd),
			s30: 1/(Gspd*30),
			s10: 1/(Gspd*10),
			s5: 1/(Gspd*5),
			s3: 1/(Gspd*3),
			s1: 1/Gspd
			
		}
		
	#endregion
	
}

function init_room() {
	
	room_width = ww
	room_height = wh
	surface_resize(application_surface,ww,wh)
	
}
	
function init_prompt(xy,str) {
	
	var ret = instance_create_layer(0,0,"Prompt",oPrompt)
	ret.xy = xy
	ret.str = str
	ret.active = t
	return ret
	
}

function init_node(xy,str,state,in_room,to_room,parent) {
	
	var ret = instance_create_layer(xy[0],xy[1],"Nodes",oNode)
	ret.xx = xy[0]
	ret.yy = xy[1]
	ret.str = str
	ret.state = state
	ret.in_room = in_room
	ret.to_room = to_room
	ret.parent = parent
	ret.active = t
	return ret
	
}

function init_entity(xy,str,state,in_room,parent) {
	
	var ret = instance_create_layer(xy[0],xy[1],"Nodes",oEntity)
	ret.xx = xy[0]
	ret.yy = xy[1]
	ret.str = str
	ret.state = state
	ret.in_room = in_room
	ret.parent = parent
	ret.active = t
	return ret
	
}

function init_context(xy,str,state,in_room,parent) {
	
	var ret = instance_create_layer(xy[0],xy[1],"Nodes",oContext)
	ret.xx = xy[0]
	ret.yy = xy[1]
	ret.str = str
	ret.state = state
	ret.in_room = in_room
	ret.parent = parent
	ret.active = t
	return ret
	
}