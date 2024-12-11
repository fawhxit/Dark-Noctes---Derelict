/// @description Game Updates

if(is2(subGame)) {
	
	try {
		
		switch(subGame.object_index) {
			
			case eSniperGame: {
				
				if(!is2(subGame.alarm[0])
					and subGame.initd == f) {
					
					subGame.alarm[0] = 4
					subGame.initd = t
					
				}
				break
				
			}
			
			default: subGame = noone; break;
			
		}
		
	} catch(_ex) {
		
		show_debug_message("Subgame Crash!")
		show_debug_message(_ex)
		subGame = noone
		
	}
	
} else {
	
	#region Tutorial
		
		if(tut.start and !tut.done) {
			
			#region Flashlight Msg
				
				// Do Tutorial
				if(tut.flash.rdy and !tut.flash.done) {
					
					with(tut.flash) {
						
						if(deli >= del and !is2(inst)) {
							
							inst = instance_create_layer(0,0,"Prompt",oMsg)
							inst.str = msg
							inst.trgEnd = trg
							inst.par = self
							
						} else deli += 1
						
						if(is2(inst)) {
							
							if(p.flash.on) {
								
								done = t
								inst.earlyTrg = t
								
							}
							
						}
						
					}
					
				} else tut.search.rdy = t
				
			#endregion
			
			#region Search Msg
				
				if(tut.search.rdy and !tut.search.done) {
					
					// Do Tutorial
					with(tut.search) {
						
						if(deli >= del and !is2(inst)) {
							
							inst = instance_create_layer(0,0,"Prompt",oMsg)
							inst.str = msg
							inst.trgEnd = trg
							inst.par = self
							
						} else deli += 1
						
						if(is2(inst)) {
							
							if(p.search.on) {
								
								done = t
								inst.earlyTrg = t
								
							}
							
						}
						
					}
					
				}
				
			#endregion
			
			#region Take Msg
				
				if(tut.take.rdy and !tut.take.done and tut.search.done) {
					
					// Do Tutorial
					with(tut.take) {
						
						if(deli >= del and !is2(inst)) {
							
							inst = instance_create_layer(0,0,"Prompt",oMsg)
							inst.str = msg
							inst.par = self
							
						} else deli += 1
						
						if(is2(inst)) {
							
							if(!ds_list_empty(p.inv)) {
								
								done = t
								inst.earlyTrg = t
								
							}
							
						}
						
					}
					
				}
				
			#endregion
			
			#region Inventory Msg
				
				if(tut.inv.rdy and !tut.inv.done and tut.take.done) {
					
					// Do Tutorial
					with(tut.inv) {
						
						if(deli >= del and !is2(inst)) {
							
							inst = instance_create_layer(0,0,"Prompt",oMsg)
							inst.str = msg
							inst.par = self
							
						} else deli += 1
						
						if(is2(inst)) {
							
							if(p.inv_show) {
								
								done = t
								inst.earlyTrg = t
								
							}
							
						}
						
					}
					
				}
				
			#endregion
			
			#region Past Tutorial Area
				
				if(room == rBunker0) {
					
					tut.inv.done = t
					if(is2(tut.inv.inst)) tut.inv.inst.fadeAway = t
					tut.take.done = t
					if(is2(tut.take.inst)) tut.take.inst.fadeAway = t
					tut.search.done = t
					if(is2(tut.search.inst)) tut.search.inst.fadeAway = t
					tut.flash.done = t
					if(is2(tut.flash.inst)) tut.flash.inst.fadeAway = t
					
				}
				
			#endregion
			
			// Tutorial Done?
			if(tut.flash.done and tut.search.done and tut.take.done and tut.inv.done)
				tut.done = t
			
		}
		
	#endregion
	
	#region Spawn Monster
		
		if(state == game.play and !dbgDisableMon) {
			
			// Spawn Monster if:
			// Not @ Max, Minute State True
			// A 10th Second and Wind is High
			if(!dbgMon and monSz < monMx and ((ms and si%5 == 0) or (monDif >= 1))
				and monDeli >= monDel) {
				
				if(monDif == 0) {
					
					// Easiest
					// BT
					if(env.wind_delta < 0) monL[|monSz] = instance_create_layer(s.set.w*1.2,rMidy,"Environment",oMon1)
					else monL[|monSz] = instance_create_layer(s.set.w*-.2,rMidy,"Environment",oMon1)
					
					monDelMn = 4
					monDelMx = 5
					
					
				} else if(monDif == 1) {
					
					/* Easiest */
					// Bunker
					if(env.wind_delta < -1)
						monL[|monSz] = instance_create_layer(s.set.w*1.2,rMidy,"Environment",oMon1)
					else if(env.wind_delta > 1) monL[|monSz] = instance_create_layer(s.set.w*-.2,rMidy,"Environment",oMon1)
					
					monDelMn = 3
					monDelMx = 4
					
				} else if(monDif == 2) {
					
					// Courtyard
					if(env.wind_delta < -.8)
						monL[|monSz] = instance_create_layer(s.set.w*1.2,rMidy,"Environment",oMon1)
					else if(env.wind_delta > .8) monL[|monSz] = instance_create_layer(s.set.w*-.2,rMidy,"Environment",oMon1)
					
					monDelMn = 2
					monDelMx = 4
					
				} else if(monDif == 3) {
					
					// Armory/Warehouse
					if(env.wind_delta < -.6)
						monL[|monSz] = instance_create_layer(s.set.w*1.2,rMidy,"Environment",oMon1)
					else if(env.wind_delta > .6) monL[|monSz] = instance_create_layer(s.set.w*-.2,rMidy,"Environment",oMon1)
					
					monDelMn = 1
					monDelMx = 3
					
				} else if(monDif == 4) {
					
					// Armory/Warehouse/Powerplant
					if(env.wind_delta < -.4)
						monL[|monSz] = instance_create_layer(s.set.w*1.2,rMidy,"Environment",oMon1)
					else if(env.wind_delta > .4) monL[|monSz] = instance_create_layer(s.set.w*-.2,rMidy,"Environment",oMon1)
					
					monDelMn = 1
					monDelMx = 2
					
				} else if(monDif == 5) {
					
					// Powerplant (Unless Armory/Warehouse Skip)
					if(env.wind_delta < -.2)
						monL[|monSz] = instance_create_layer(s.set.w*1.2,rMidy,"Environment",oMon1)
					else if(env.wind_delta > .2) monL[|monSz] = instance_create_layer(s.set.w*-.2,rMidy,"Environment",oMon1)
					
					monDelMn = .5
					monDelMx = 1
					
				} else if(monDif == 6) {
					
					// Research FORCE
					if(env.wind_delta < 0)
						monL[|monSz] = instance_create_layer(s.set.w*1.2,rMidy,"Environment",oMon1)
					else monL[|monSz] = instance_create_layer(s.set.w*-.2,rMidy,"Environment",oMon1)
					
					monDelMn = .1
					monDelMx = .5
					/* Hardest */
					
				}
				
				monDeli++
				
			} else monDeli++
			
			// Reset monDel
			if(monDeli > monDel) {
				
				// Reset Monster Timer.... ?
				monDel = Gspd*irandom_range(60*monDelMn,60*monDelMx)
				if(!instance_exists(oMon1)) monDel/=2
				monDeli = 0
				
				
			}
			
			#region Debug
				
				if(dbgMon and monSz < monMx and ds_list_empty(monL)) {
					
					if(env.wind_delta < -.5)
						monL[|0] = instance_create_layer(rMidx+s.set.w*.5,rMidy,"Environment",oMon1)
					else if(env.wind_delta > .5) monL[|0] = instance_create_layer(rMidx-s.set.w*.5,rMidy,"Environment",oMon1)
					
					if(!ds_list_empty(monL)) {
						
						var m = monL[|0]
						m.parent = id
						
					}
					
				}
			
			#endregion
			
		}
		
	#endregion
	
	#region Hit/Attack
		
		if(is2(p.in_hand)) {
			
			if(p.in_hand.state == ent.weapon) {
				
				if(mblp and !p.swing and !p.swingd)
					p.swing = t
				else if(p.swing and !p.swingd) {
					
					#region Iterate Swing Timer
						
						if(p.swingi >= p.swingDel) p.swingd = t
						else p.swingi++
						
					#endregion
					
					#region Swing Swoosh SFX
						
						if(!p.swingSndd and !audio_is_playing(sndSwing)) {
							
							audio_play_sound(sndSwing,0,f,1,0,random_range(.8,1))
							p.swingSndd = t
							
						}
						
					#endregion
					
					#region Monster Hit Registration
						
						var _mon = monL[|0]
						if(is2(_mon) and !p.swingHit and p.swingi/p.swingDel >= .2) {
							
							if(mouse_in_circle([_mon.x,_mon.y],sprite_get_width(_mon.spr)*_mon.image_xscale)) {
								
								#region Set Flee
									
									_mon.behavior = mon.flee
									_mon.bvri = 0
									p.swingHit = t
									
								#endregion
								
								#region Hit SFX
									
									if(p.in_hand.spr == sprBranch) {
										
										if(env.outdoor) {
											
											audio_play_sound(sndHitBaseNormal,0,f,1,0,random_range(.9,1.0))
											audio_play_sound(sndHitBranchNormal,0,f,1,0,random_range(.9,1.0))
											
										} else {
											
											audio_play_sound(sndHitBaseReverb,0,f,1,0,random_range(.9,1.0))
											audio_play_sound(sndHitBranchReverb,0,f,1,0,random_range(.9,1.0))
											
										}
										
									} else if(p.in_hand.spr == sprCrowbar) {
										
										if(env.outdoor) {
											
											audio_play_sound(sndHitBaseNormal,0,f,1,0,random_range(.9,1.0))
											audio_play_sound(sndHitCrowbarNormal,0,f,1,0,random_range(.9,1.0))
											
										} else {
											
											audio_play_sound(sndHitBaseReverb,0,f,1,0,random_range(.9,1.0))
											audio_play_sound(sndHitCrowbarReverb,0,f,1,0,random_range(.9,1.0))
											
										}
										
									}
									
								#endregion
								
								#region Durability Iterate
									
									p.in_hand.durability--
									
									if(p.in_hand.durability <= 0) {
										
										instance_destroy(p.in_hand)
										p.in_hand = noone
										
									}
									
								#endregion
								
								#region Monster Pain
									
									_mon.eyes.deli = Gspd*5
									_mon.eyes.image_speed = 0
									_mon.eyes.image_index = random_range(0,2)
									audio_play_sound_on(_mon.mon1_emitter,sndVoice4,f,0,1,0,random_range(.6,.8))
									
								#endregion
								
							}
							
						}
						
					#endregion
					
				} else if(p.swing and p.swingd) {
					
					#region De-iterate then done+reset
						
						if(p.swingi <= 0) {
							p.swingd = f
							p.swing = f
							p.swingHit = f
							p.swingSndd = f
						} else p.swingi--
						
					#endregion
					
				}
				
			}
			
		}
		
	#endregion
	
	#region Fadeout Theme
		
		/*
		if(state != game.init) {
			
			if(audio_is_playing(msxSkulton)) {
				
				var _dlt = 1/(Gspd*13)
				var _g = audio_sound_get_gain(msxSkulton)
				if(_g < 0.03) audio_stop_sound(msxSkulton)
				audio_sound_gain(msxSkulton,_g-_dlt,0)
				
			}
			
		}
		*/
		
	#endregion
	
	#region Debug Audio
		
		if(dbgSnd and room == rBT0) {
			
			// Init Emitter
			if(dbgEmt == noone) dbgEmt = audio_emitter_create()
			
			// Play sound Again and Iterate
			if(!audio_is_playing(dbgSFX)) {
				
				// Init
				audio_play_sound_on(dbgEmt,dbgSFX,f,1,dbgVol)
				dbgEmtx += 10*dbgEmtxi
				
				// Update Emitter
				audio_emitter_position(dbgEmt,dbgEmtx,0,0)
				audio_emitter_gain(dbgEmt,lim2_pct(dbgEmtx,audLimx[0],0,audLimx[1],t))
				
				// Iterate Emitter Position
				if(dbgEmtx <= -200 and dbgEmtxi < 0) dbgEmtxi *= -1
				else if(dbgEmtx >= 200 and dbgEmtxi > 0) dbgEmtxi *= -1
				
			}
			
		}
		
	#endregion

}