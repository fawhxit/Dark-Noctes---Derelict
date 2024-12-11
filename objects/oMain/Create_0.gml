/// @description Basic Inits

#region Debug
	
	// Flag
	dbg = f
	dbgMode = dbgOpt.hide
	dbgSnd = f
	dbgEnd = f
	dbgMon = f
	dbgDif = f
	dbgDisableMon = f
	
	// Values
	#macro NEXT_TODO  noone
	#macro BACK_TODO  noone
	#macro NEXTL_TODO noone
	#macro NEXTR_TODO noone
	dbgxy  = {}
	if(file_exists(game_save_id+"main.json")) {
		
		var fl = file_text_open_read(game_save_id+"main.json")
		var str = ""
		while(!file_text_eof(fl))
			str += file_text_readln(fl)
		file_text_close(fl)
		dbgxy = json_parse(str)
		
	}
	dbgxyi = variable_instance_names_count(dbgxy)
	dbgxyi2 = 0
	dbgxyOn = f
	dbgxyType = noone
	dbgxysel = noone
	dbgxyedit = noone
	
	#region Debug Audio Vars
		
		dbgEmt = noone // Emitter
		dbgEmtx = 100
		dbgVol = 1
		dbgSFX = scanDecline
		dbgEmtxi = 1
		
	#endregion
	
#endregion

#region Main Vars
	
	dark_a_base = .95
	dark_a = dark_a_base
	vol = 2/3
	subGame = noone
	startPol = irandom(1)
	
#endregion

#region Mouse
	
	m = instance_create_layer(0,0,"Prompt",oCursor)
	
	// Panning x/y PCT
	mx_pct = clamp(wmx/ww,0,1)
	my_pct = clamp(wmy/wh,0,1)
	
#endregion

#region Misc
	
	state = game.init
	vRef = 1.34
	wRef = ww*vRef
	hRef = wh*vRef
	darkSurf = noone
	roomOld = rInit
	prompt = noone
	draw_set_circle_precision(64)
	bot_rng = [(wh*0.7)+((wh*0.3)*(.33/1.34)),
		(wh*0.7)+((wh*0.3)*(1.67/1.34))]
	rel_rng = [2/3,1+(1/3)]
	
	// rInit Disclaim Vars
	rInitDel = Gspd*7
	rInitDeli = 0
	rIniti = 0
	lgRot = irandom_range(Gspd/8,Gspd/2)
	
#endregion

#region Audio Vars
	
	audLimx = [-150,150]
	playGateSFX = f
	gateSFX = noone
	
#endregion

#region Player Vars
	
	p = {
		
		// Vars
		name  : undefined,
		state : verb.start,
		dark  : t,
		inv   : ds_list_create(),
		inv_size : 3,
		inv_show : f,
		in_hand  : noone,
		killer   : noone,
		discover : 0,
		swing    : f,
		swingd   : f,
		swingDel : Gspd/3,
		swingi   : 0,
		swingSndd : f,
		swingHit : f,
		
		fore : {
			
			active: f,
			pct: 0,
			spd: 1/(Gspd*3),
			zmn: 1.0,
			zmx: 1.2,
			zi : function(zmn,zmx,pct) { return lerp(zmn,zmx,pct) },
			reset: function() { pct = 0 },
			S: function(spd) { 
				
				if(!keyboard_check(vk_shift)) pct = clamp(pct-spd,0,1)
				else pct = clamp(pct-(spd*2),0,1)
				
			},
			W: function(spd) { 
				
				if(!keyboard_check(vk_shift)) pct = clamp(pct+spd,0,1)
				else pct = clamp(pct+(spd*2),0,1)
				
			}
			
			
		},
		
		// Flashlight
		flash : {
			
			on    : f,
			disable : f,
			a     : 1,
			scl   : (wh/sprite_get_height(sprFlash))*.8,
			rad   : 0,
			flick : {
				
				// Dur(ation), How long flickering lasts
				dur     : 0,
				dur_rng : [round(Gspd/2),round(Gspd*1.5)],
				duri    : 0,
				
				// Del(ay), frames in between flicker changes
				del     : 0,
				del_rng : [0,6],
				deli    : 0,
				
				// Alpha Ranges
				lo_rng  : [0.0,0.34],
				hi_rng  : [0.0,0.67]
				
			}
			
		},
		
		// Search
		search : {
			
			on   : f,
			done : f,
			dur  : Gspd,
			duri : 0,
			rad  : 0,
			fgc  : c_aqua,
			fga  : 0.9
			
		},
		
		/* DISABLED
		res_inv: {
			
			wt_tot:0,
			wt_mx:100,
			unknown: {
				
				num:0,
				wt:1.0,
				wt_tot:0
				
			},
			inorganic: {
				
				num:0,
				wt:1.0,
				wt_tot:0
				
			},
			organic: {
				
				num:0,
				wt:1.0,
				wt_tot:0
				
			},
			plant: {
				
				num:0,
				wt:0.25,
				wt_tot:0
				
			},
			stone: {
				
				num:0,
				wt:2.0,
				wt_tot:0
				
			},
			wood_log: {
				
				num:0,
				wt:20.0,
				wt_tot:0
				
			},
			wood_scrap: {
				
				num:0,
				wt:1.0,
				wt_tot:0
				
			}
			
		}
		*/
	}
	
#endregion

#region Help Vars
	
	tut = {
		
		start: f,
		done: f,
		flash: {
			
			rdy: t,
			del: Gspd*5,
			deli: 0,
			done: f,
			trg: "F",
			msg: "Press 'F' to Toggle Flashlight...",
			inst: noone
			
		},
		
		inv: {
			
			rdy: f,
			del: Gspd*5,
			deli: 0,
			done: f,
			trg: vk_tab,
			msg: "Press 'Tab' for Inventory...",
			inst: noone
			
		},
		
		search: {
			
			rdy: f,
			del: Gspd*5,
			deli: 0,
			done: f,
			trg: mb_right,
			msg: "Hold 'Right Click' to Search...",
			inst: noone
			
		},
		
		take: {
			
			rdy: f,
			del: Gspd*5,
			deli: 0,
			done: f,
			trg: mb_left,
			msg: "Hold 'Left Click' to Pickup...",
			inst: noone
			
		}
		
	}
	
#endregion

#region Timing
	
	str_fra = "00"
	str_sec = "00"
	str_min = "00"
	str_hou = "00"
	
#endregion

#region Scene Instances (Done now in room creation)
	
	/* DISABLED
	scene_col_00 = noone // Colony Scenes; (Dist From Exterior; Even right/Odd left)
	scene_col_10 = noone
	scene_col_12 = noone
	scene_col_14 = noone
	scene_col_16 = noone
	scene_col_20 = noone
	scene_col_22 = noone
	scene_col_30 = noone
	scene_col_31 = noone
	scene_col_32 = noone
	scene_col_33 = noone
	scene_col_34 = noone
	scene_col_40 = noone
	scene_col_41 = noone
	scene_col_42 = noone
	scene_col_50 = noone
	scene_qua0 = noone
	scene_qua1 = noone
	scene_qua2 = noone
	scene_qua3 = noone
	scene_bt0 = noone
	scene_bt1 = noone
	scene_bt2 = noone
	scene_bt3 = noone
	scene_bt4 = noone
	scene_cy0 = noone
	scene_cy1 = noone
	scene_cy2 = noone
	scene_cy6 = noone
	scene_cy7 = noone
	scene_cy8 = noone
	*/
	
#endregion

#region Monster
	
	rMidx = dw/2
	rMidy = dh/2
	monL = ds_list_create()
	monMx = 1
	monSz = 0
	monDif = 0
	monDelMn = 4
	monDelMx = 5
	monDel = Gspd*irandom_range(monDelMn*60,monDelMx*60)
	monDeli = 0
	
#endregion

#region Generated Values
	
	reg = noone // Random Event Generator Instance
	gvs = { // Generated Values Struct
		
		// 0: Lake (1)
		// 1: Bridge (2)
		bunkerCard: irandom(1),
		// 0: Lockers (2)
		// 1: Office (6)
		// 2: Chem Work (8)
		// 3: Generator (11)
		// 4: Pipeworks (13)
		// 5: Workbench (15)
		securityCard: irandom(5),
		// 0: Outside Security (1)
		// 1: Outside Depot (2)
		// 2: Security Basement (4)
		// 3: Outside Power Plant (8)
		warehouseCard: irandom(3),
		// 0: Security Tower (5)
		// 1: Break Room (10)
		// 2: Kitchen (11)
		// 3: Cold Storage (12)
		powerCard: irandom(3),
		// 0: Nuclear Plant (9)
		// 1: Waste Proc (10)
		researchCard: irandom(1),
		// i.e. "3E9aO7"
		code1: gen_string(t,t,6),
		// 0: Bunker 5
		// 1: Bunker 9
		// 2: 
		crowbar: irandom(5)
		
	}
	
#endregion

#region Overrides
	
	controlOverride = f
	
#endregion

#region Contextual
	
	contextEmt = audio_emitter_create()
	audio_emitter_position(contextEmt,0,0,0)
	
	#region Logs
		
		logPlayList = ds_list_create()
		
	#endregion
	
#endregion

// Init
init_room()
alarm[1] = 1