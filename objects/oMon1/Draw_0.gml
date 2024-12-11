/// @description Draw & Main Logic

if(active) {
	
	#region Debug Logic (Behavior)
		
		if(is2(dbg_bvr) and M.dbg)
			behavior = dbg_bvr
		
	#endregion
	
	#region Spawn Fog
		
		fog_i = ds_list_size(fog_L)
		if(fog_i < fog_mx) {
			
			ds_list_add(fog_L,instance_create_layer(xx,yy,"Environment",oMon1_Fog))
			var e    = fog_L[|fog_i]
			e.parent = id
			e.ii     = fog_i
			fog_i   += 1
			e.depth = depth+fog_i
			e.image_xscale = (scl+1)*(random_range(0.67,1.0))
			e.image_yscale = e.image_xscale
			
		}
		
	#endregion
	
	#region Other Updates
		
		image_alpha  = random_range(0.8,1.0) // Alpha Randomness??
		image_angle += 1.51 // Spin
		
	#endregion
	
	#region X Movement
		
		switch(behavior) {
			
			case mon.fast: {
				
				// Set Target
				if(array_equals(txy,[])) {
					
					var _wh = [real(s.set.w),real(s.set.h)]
					txy = [ random_range(0,_wh[0]), random_range(_wh[1]*(2/3),_wh[1]*(.8)) ]
					
				} else if(array_length(txy) == 2 and 5 >= txy[0]+s.set.dlt[0]-(xx+s.set.dlt[0]) and 5 >= txy[1]+s.set.dlt[1]-(yy+s.set.dlt[1]))
					txy = []
				else if(array_length(txy) == 2) {
					
					xx = lerp(real(xx),txy[0],1/32)
					yy = lerp(real(yy),txy[1],1/32)
					
				}
				
				if(bvri >= bvrd) {
					
					// Change Behavior
					behavior = mon.flee
					bvri = 0
					bvrd = random_range(bvrmx,bvrmx)
					if(!is2(sfx3) or !audio_is_playing(sfx3))
						sfx3 = audio_play_sound_on(mon1_emitter,sndVoice4,f,1,1,0,random_range(.8,1))
					
				} else bvri++ // Iterate Behavior Timer
				break
				
			}
			
			case mon.chase: {
				
				var modi = max(1,M.monDif)
				
				if(xx < wmx)
					xx += 20
				else if(xx > wmx)
					xx -= 20
				
				// Back to Idle
				if(point_distance(x,y,wmx,y) < (s.set.w/4)/modi)
					behavior = mon.idle
				break
				
			}
			
			case mon.creep: {
				
				// Delay Behavior Change (Make Longer)
				if(bvrd < bvrmx) bvrd = random_range(bvrmx,bvrmx*3)
				if(!is2(creepRad)) creepRad = random_range(p.flash.rad,p.flash.rad*3)
				
				var modi = max(1,M.monDif)
				var _xx = xx+s.set.dlt[0]
				var _yy = yy+s.set.dlt[1]
				
				// X Adjust
				// Creep To?
				if(_xx+modi < wmx and point_distance(_xx,_yy,wmx,wmy) > creepRad+20+modi)
					xx += modi
				else if(_xx-modi > wmx and point_distance(_xx,_yy,wmx,wmy) > creepRad+20+modi)
					xx -= modi
				// Creep Away?
				if(point_distance(_xx,_yy,wmx,wmy) < creepRad+10)
					xx += modi*cos(degtorad(point_direction(_xx,_yy,wmx,wmy)+180))
				
				// Y Adjust
				// Creep To?
				if(_yy > (s.set.h/3)+s.set.dlt[1] and _yy+modi > wmy and point_distance(_xx,_yy,wmx,wmy) > creepRad+20+modi)
					yy -= modi/2
				else if(_yy < (s.set.h-(s.set.h/3))+s.set.dlt[1] and _yy+modi < wmy and point_distance(_xx,_yy,wmx,wmy) > creepRad+20+modi)
					yy += modi/2
				// Creep Away?
				if(point_distance(_xx,_yy,wmx,wmy) < creepRad+10)
					yy += modi*-sin(degtorad(point_direction(_xx,_yy,wmx,wmy)+180))
				
				
				if(bvri >= bvrd) {
					
					// Zeroize Creep Rad
					creepRad = noone
					
					// Change Behavior
					if(chance(10)) {
						
						// Switch to Flee
						behavior = mon.flee
						if(!is2(sfx3) or !audio_is_playing(sfx3))
							sfx3 = audio_play_sound_on(mon1_emitter,sndVoice4,f,1,1,0,random_range(.8,1))
							
					} else if(chance(5)) {
						
						// Switch to Fast Attack
						behavior = mon.fast
						if(!is2(sfx3) or !audio_is_playing(sfx3))
							sfx3 = audio_play_sound_on(mon1_emitter,sndLaugh,f,1,2,0,random_range(.95,1.05))
							
					} else if(chance(20)) {
						
						// Creep More
						behavior = mon.creep
						
					} else {
						
						// Idle
						behavior = mon.idle
						
					}
					
					bvri = 0
					bvrd = random_range(bvrmx,bvrmx)
					
				} else bvri++ // Iterate Behavior Timer
				
				break
				
			}
			
			case mon.flee: {
				
				if(x > ww/2) xx += 20
				else xx -= 20
				break
				
			}
			
			case mon.idle:
			default: {
				
				if(!dbg_move) {
					
					// Apply wind based movement
					xx += (env.wind_delta*(0.8+(M.monDif/10)))
					
				} else {
					
					// Manually Enter Position Here for Debugging
					xx = s.set.w/2
					
				}
				
				if(bvri >= bvrd) {
					
					// Change Behavior
					if(chance(10)) {
						
						// Fast
						behavior = mon.fast
						if(!is2(sfx3) or !audio_is_playing(sfx3))
							sfx3 = audio_play_sound_on(mon1_emitter,sndLaugh,f,1,2,0,random_range(.95,1.05))
						
					} else if(chance(10)){
						
						// Chase
						behavior = mon.chase
						if(!is2(sfx3) or !audio_is_playing(sfx3))
							audio_play_sound_on(mon1_emitter,sndGrowl,f,1,2,0,random_range(.95,1.05))
							
					} else if(chance(10)){
						
						// Creep
						behavior = mon.creep
						
					} else {
						
						// Idle
						behavior = mon.idle
						if(!is2(sfx3) or !audio_is_playing(sfx3)
							and chance(1/3)) {
							
							switch(irandom(3)) {
								
								case 0: sfx3 = audio_play_sound_on(mon1_emitter,sndGrowl,f,1,2,0,random_range(.95,1.05)); break;
								case 1: sfx3 = audio_play_sound_on(mon1_emitter,sndVoice1,f,1,1,0,random_range(.8,1)); break;
								case 2: sfx3 = audio_play_sound_on(mon1_emitter,sndVoice2,f,1,1,0,random_range(.8,1)); break;
								case 3: sfx3 = audio_play_sound_on(mon1_emitter,sndVoice3,f,1,1,0,random_range(.8,1)); break;
								
							}
							
						}
						
					}
					bvri = 0
					bvrd = random_range(bvrmn,bvrmx)
					
				} else bvri++ // Iterate Behavior Timer
				
			}
			
		}
		
	#endregion
	
	#region Additional SFX
		
		if((x < s.set.dlt[0] or x > s.set.dlt[0]+s.set.w)
			and fi == 1 and !is2(sfxEnv) and chance(50) and sfxEnvd <= 0) {
			
			if(!env.outdoor or env.shelter) {
				
				switch(irandom(2)) {
					
					case 0: {
						
						sfxEnv = audio_play_sound_on(mon1_emitter,sndBottleTumble,f,0,random_range(.8,1),0,random_range(.9,1))
						sfxEnvd = Gspd*60
						break
						
					}
					
					case 1: {
						
						sfxEnv = audio_play_sound_on(mon1_emitter,sndChairFall,f,0,random_range(.8,1),0,random_range(.9,1))
						sfxEnvd = Gspd*60
						break
						
					}
					
					case 2: {
						
						sfxEnv = audio_play_sound_on(mon1_emitter,sndGlassShatter,f,0,random_range(.8,1),0,random_range(.9,1))
						sfxEnvd = Gspd*60
						break
						
					}
					
				}
				
			}
			
		} else if(sfxEnvd > 0) sfxEnvd--
		
		if(is2(sfxEnv))
			if(!audio_is_playing(sfxEnv))
				sfxEnv = noone
		
	#endregion
	
	#region Cover/Uncover Position Adjusts
		
		if(cov.pct <= 0) {
			
			#region No Cover Position Adjust
				
				x = s.set.dlt[0]+xx
				y = s.set.dlt[1]+yy
				y += (sin(degtorad(f_i))*64) // Monster Sway
				
			#endregion
			
		} else {
			
			#region Cover Position Adjust
				
				// X
				if(cov.left or cov.last_cover == verb.hide_left) // Hide Left
					x = (s.set.dlt[0]*(1-(0.75*cov.pct)))+xx
				else if(cov.right or cov.last_cover == verb.hide_right)
					x = ((s.set.dlt[0]*(1-(0.75*cov.pct)))+s.set.dlt_mx[0]*(0.75*cov.pct))+xx
				
				// Y
				y = ((s.set.dlt[1]*(1-(0.75*cov.pct)))+(s.set.dlt_mx[1]*(0.75*cov.pct)))+yy
				y += (sin(degtorad(f_i))*64) // Monster Sway
				
			#endregion
			
		}
	
	#endregion
	
	#region Speed PCT Update (Used by Fog)
		
		spd_pct = (1+scl_pct+(M.monDif/10))
		
		/* OUTDATTED
		x = xx+(s.set.dlt[0]*spd_pct)
		y = yy+(s.set.dlt[1]*spd_pct) + ( sin( degtorad( f_i ) ) * 64)
		*/
		
	#endregion
	
	#region Update Eye x/y
		
		eyes.x = x
		eyes.y = y
		
	#endregion
	
	#region Draw & Destroy Trigger Logic
		
		if(point_distance(wmx,wmy,x,y) <= p.flash.rad*1.1 and p.flash.on) {
			
			#region Flashlight Illumination
				
				// Init Dark Surface
				if(!surface_exists(liteSurf))
					liteSurf = surface_create(ww,wh)
				surface_set_target(liteSurf)
				
				// Draw Stuff.... (i.e.)
				draw_self()
				gpu_set_colorwriteenable(t,t,t,f)
				draw_sprite_ext(sprFlash,0,wmx,wmy,p.flash.scl,p.flash.scl,0,c_dkgray,0.225*p.flash.a)
				gpu_set_colorwriteenable(t,t,t,t)
				
				// Reset Surface and Draw
				surface_reset_target()
				draw_set_alpha(1)
				draw_surface(liteSurf,0,0)
				
			#endregion
			
		} else if(boundx != noone and (point_distance(M.mx_pct*s.set.w,0,xx,0) > boundx)) {
			
			#region Destroy Monster (Out of Bounds)
				
				var l_sz = ds_list_size(fog_L)
				instance_destroy(eyes)
				for(var i=0;i<l_sz;i++) instance_destroy(fog_L[|i]) // Destroy All Fogs (Awful joke potential)
				ds_list_destroy(fog_L)
				ds_list_clear(parent.monL)
				instance_destroy(id)
				
			#endregion
			
		} else draw_self() // Plain Draw
		
	#endregion
	
	#region Frame Iterate
		
		f_i += f_spd+random(f_spd)+(M.monDif/10)
		if(f_i >= 360) f_i   -= 360
		else if(f_i < 0) f_i += 360
		
	#endregion
	
	#region Debug
		
		if(parent != noone) {
			
			// Debug Logic
			if(parent.dbgMon and !dbg_done) {
				
				if(dbg_depth) {
					
					depth           -= 200
					eyes.depth      -= 200
					fog_L[|0].depth -= 200
					
				}
				dbg_done = t
				
			}
			
		}
		
	#endregion
	
}