function main_step_begin() {
    
    if(is2(M)) {
        
        with(M) {
            
            #region Scene Instance Sanity
                
                try {
                    
                    if(s != noone) var tmp = s.scene_inst // Debug Access
                    
                } catch(_ex) {
                    
                    try {
                        
                        s.scene_inst = noone
                        
                    } catch(_ex) {}
                    
                }
                
            #endregion
            
            #region Basic
                
                // Scene's Mid X/Y Update
                try {
                    
                    if(s != noone) {
                        
                        rMidx = s.set.w2+s.set.dlt[0]
                        rMidy = s.set.h2+s.set.dlt[1]
                        
                    }
                    
                } catch(_ex) {
                    
                    // Default
                    rMidx = dw/2
                    rMidy = dh/2
                    
                }
                
                wRef = ww*vRef
                hRef = wh*vRef
                
            #endregion
            
            #region Monster Instance(s) Sanity
                
                if(state == game.play) {
                    
                    // Delete Old Monster Instances
                    for(var i = 0; i < monSz; i++)
                        if(!is(monL[|i],oMon1,f,f))
                            ds_list_delete(monL,i)
                    
                    // Monster Count
                    monSz = ds_list_size(monL)
                    
                }
                
            #endregion
            
            #region Mouse
                
                // Deltas
                // Room
                rmxd = rmxo-rmx
                rmyd = rmyo-rmy
                // Window
                wmxd = wmxo-wmx
                wmyd = wmyo-wmy
                
                // Pan
                mx_pct = clamp(wmx/ww,0,1)
                my_pct = clamp(wmy/wh,0,1)
                
            #endregion
            
            #region Audio
                
                audio_set_master_gain(0,vol)
                
            #endregion
        	
        	#region Blend BG
                
                #region If Lightening
                    
                    if(env.light_leni != noone) {
                        
                        #region BG Blend from Lightening
                            
                            if(is2(s)) {
                                
                                env.blend_override = t
                                var tmpcv = lerp(128,255,env.light_a)
                                env.blend_current = make_color_rgb(tmpcv,tmpcv,tmpcv)
                                
                            }
                            
                        #endregion
                        
                    }
                    
                #endregion
                
        	#endregion
        	
        }
        
    }
    
}

function main_step() {
    
    if(is2(M)) {
        
        with(M) {
            
            
            
        }
        
    }
    
}

function main_step_end() {
    
    if(is2(M)) {
        
        with(M) {
            
            #region Mouse
                
                // Olds
                // Room
                rmxo = rmx
                rmyo = rmy
                // Window
                wmxo = wmx
                wmyo = wmy
                
            #endregion
            
            #region Timing
                
                // Init
                fi += 1
                fs = flip()
                if(fd > 0) fd -= 1
                
                if(fi == Gspd) {
                	
                	fi = 0
                	si += 1
                	ss = flip()
                	if(sd > 0) sd -= 1
                	
                	if(si == 60) {
                		
                		si = 0
                		mi += 1
                		ms = flip()
                		if(md > 0) md -= 1
                		
                		if(mi == 60) {
                			
                			mi = 0
                			hi += 1
                			hs = flip()
                			if(hd > 0) hd -= 1
                			
                		}
                		
                	}
                	
                }
                
                // Update Strings
                if(fi < 10) str_fra = "0"+string(fi)
                else str_fra = string(fi)
                
                if(si < 10) str_sec = "0"+string(si)
                else str_sec = string(si)
                
                if(mi < 10) str_min = "0"+string(mi)
                else str_min = string(mi)
                
                if(hi < 10) str_hou = "0"+string(hi)
                else str_hou = string(hi)
                
            #endregion
            
        }
    
    }
    
}

function main_draw_end() {
	
	if(is2(M)) {
    	
    	with(M) {
    	    
        	#region Darkness/Flashlight
        		
        		if(state == game.play and p.dark
        			and room != rMenu) {
        			
        			#region Init
        				
        				// Dark Surface
        				if(!surface_exists(darkSurf))
        					darkSurf = surface_create(ww,wh)
        				surface_set_target(darkSurf)
        				
        				// Draw Darkness
        				draw_set_alpha(env.lights_a)
        				draw_rectangle_color(0,0,ww,wh,
        					env.lights_current,env.lights_current,env.lights_current,env.lights_current,f)
        				
        			#endregion
        			
        			#region Reset BG Blend
        				
        				if(is2(s)) {
        					
        					env.blend_override = f
        					env.blend_current = env.blend_off
        					
        				}
        				
        			#endregion
        			
        			#region Lightening
        				
        				if(env.light_leni != noone) {
        					
        					if(!env.shelter) draw_sprite_ext(sprLightFlash,0,env.light_x,env.light_y,
        						p.flash.scl,p.flash.scl,irandom(359),env.light_c,env.light_a)
        					
        					gpu_set_blendmode(bm_subtract)
        					
        					if(!env.shelter) draw_sprite_ext(sprLightFlash,0,env.light_x,env.light_y,
        						p.flash.scl,p.flash.scl,irandom(359),env.light_c,env.light_a)
        					draw_set_alpha(env.light_a)
        					draw_rectangle_color(0,0,ww,wh,env.light_c,env.light_c,env.light_c,env.light_c,f)
        					
        					gpu_set_blendmode(bm_normal)
        					
        				}
        				
        			#endregion
        			
        			#region FX Subtractions
        				
        				var fxsNames = variable_instance_get_names(FXS)
        				for(var i = 0; i < array_length(fxsNames); ++i) {
        					
        					var n = fxsNames[i]
        					var e = FXS[$n]
        					if(is(e,oFX,t,t)) {
        						
        						gpu_set_blendmode(bm_subtract)
        						
        						if(e.gl_active) {
        							
        							var scl = ((e.ltr*e.glrm)*2)/sprite_get_width(sprBloom)
        							draw_sprite_ext(sprBloom,0,e.xx,e.yy,scl,scl,
        								0,env.lights_current,(e.lta*e.glam))
        							
        						} else {
        							
        							if(e.lt_active) {
        								
        								var scl = (e.ltr*2)/sprite_get_width(sprBloom)
        								draw_sprite_ext(sprBloom,0,e.xx,e.yy,scl,scl,
        									0,env.lights_current,e.lta)
        								
        							}
        							
        						}
        						
        						gpu_set_blendmode(bm_normal)
        						
        					}
        					
        				}
        				
        			#endregion
        			
        			#region Flashlight
        				
        				if(p.flash.on and !p.inv_show and s.scene_inst = noone) {
        					
        					// Blend Mode On...
        					gpu_set_blendmode(bm_subtract)
        					
        					if(p.flash.flick.dur > p.flash.flick.duri) {
        						
        						#region Flicker FX
        							
        							p.flash.a = 0
        							
        							#region Flicker SFX
        								
        								if(!audio_is_playing(flashFlick))
        									audio_play_sound_at(flashFlick,0,0,0,5,32,5,t,5,1)
        								else if(audio_is_paused(flashFlick))
        									audio_resume_sound(flashFlick)
        								
        							#endregion
        							
        							#region Flicker Iterate Alpha
        								
        								if(p.flash.flick.deli >= p.flash.flick.del) {
        									
        									if(irandom(1) == 1) {
        										
        										var rng = p.flash.flick.hi_rng
        										p.flash.a = random_range(rng[0],rng[1])
        										
        									} else {
        										
        										var rng = p.flash.flick.lo_rng
        										p.flash.a = random_range(rng[0],rng[1])
        										
        									}
        									
        									p.flash.flick.deli = 0
        									var rng2 = p.flash.flick.del_rng
        									p.flash.flick.del = irandom_range(rng2[0],rng2[1])
        									
        									
        								} else p.flash.flick.deli += 1
        								
        							#endregion
        							
        							// Draw Flickering Light
        							draw_sprite_ext(sprFlash,0,wmx,wmy,
        								p.flash.scl,p.flash.scl,0,env.lights_current,p.flash.a)
        							
        							// Iterate Flicker Time
        							p.flash.flick.duri += 1
        							
        						#endregion
        						
        					} else {
        						
        						#region Normal
        							
        							if(!audio_is_paused(flashFlick))
        								audio_pause_sound(flashFlick)
        								
        							p.flash.a = 1
        							draw_sprite_ext(sprFlash,0,wmx,wmy,
        								p.flash.scl+.67,p.flash.scl+.67,0,env.lights_current,p.flash.a)
        							
        							/* Does disabling this look a lot better?
        							gpu_set_blendmode(bm_add)
        							
        							draw_sprite_ext(sprFlash,0,wmx,wmy,
        								p.flash.scl+.5,p.flash.scl+.5,0,env.lights_current,1)
        							
        							gpu_set_blendmode(bm_normal)
        							
        							draw_sprite_ext(sprFlash,0,wmx,wmy,
        								p.flash.scl+.5,p.flash.scl+.5,0,make_color_rgb(255,255,192),p.flash.a/32)
        							*/	
        							if(fi == 0 and chance(5)) {
        								
        								var del_rng = p.flash.flick.del_rng
        								var t_rng = p.flash.flick.dur_rng
        								p.flash.flick.del = irandom_range(del_rng[0],del_rng[1])
        								p.flash.flick.dur = irandom_range(round(t_rng[0]/2),round(t_rng[1]/2))
        								p.flash.flick.deli = 0
        								p.flash.flick.duri = 0
        								
        							}
        							
        						#endregion
        						
        					}
        					
        					// Blend Mode Off...
        					gpu_set_blendmode(bm_normal)
        					
        				}
        				
        			#endregion
        			
        			#region Reset Surface and Draw
        				
        				surface_reset_target()
        				draw_set_alpha(1)
        				draw_surface(darkSurf,0,0)
        				
        			#endregion
        			
        		}
        		
        		#region Free Dark Surface if not Dark
        			
        			if(!p.dark and surface_exists(darkSurf))
        				surface_free(darkSurf)
        			
        		#endregion
        		
        	#endregion
        	
        	#region Mapped Contextuals...
        		
        		#region Draw Each Debug XY Entry per room & Edit/Control Logic
        			
        			if(state == game.play and room != rMenu) {
        				
        				if(is2(s)) {
        					
        					// Loop through all the entries in dbgxy
        					// (a struct of structs, each struct an entry with relevant data)
        					for(var i = 0; i < variable_instance_names_count(dbgxy); i++) {
        						
        						var ao = draw_get_alpha()
        						
        						// Skip deleted entries
        						if(!is2(dbgxy[$string(i)])) continue
        						
        						// Is it an actual entry yet? If "room" ain't set then it ain't defined at all yet
        						if(variable_instance_exists(dbgxy[$string(i)],"room")) {
        							
        							#region Are we in the room?
        								
        								if(dbgxy[$string(i)][$ "room"] == room_get_name(room)) {
        									
        									#region Ensure needed bools for checks
        										
        										if(!variable_instance_exists(dbgxy[$string(i)],"found"))
        											dbgxy[$string(i)][$ "found"] = f
        										
        									#endregion
        									
        									#region What shape? Circle or Rectangle?
        										
        										if(variable_instance_exists(dbgxy[$string(i)],"shape")) {
        											
        											if(dbgxy[$string(i)][$ "shape"] == "rect") {
        												
        												#region Draw Debug XY Rectangles
        													
        													if(variable_instance_exists(dbgxy[$string(i)],"xy4")) {
        														
        														#region Init
        															
        															// Init (First coordinate)
        															var _xy4 = [dbgxy[$string(i)][$ "xy4"][0]*dbgxy[$string(i)][$ "wh2"][0]+s.set.dlt[0],
        																dbgxy[$string(i)][$ "xy4"][1]*dbgxy[$string(i)][$ "wh2"][1]+s.set.dlt[1]]
        															
        														#endregion
        														
        														#region 2nd Coordinate?
        															
        															if(array_length(dbgxy[$string(i)][$ "xy4"]) == 4) {
        																
        																#region Do have 2nd Coordinate, Full Draw
        																	
        																	// Init 2nd Coordinate
        																	_xy4[2] = dbgxy[$string(i)][$ "xy4"][2]*dbgxy[$string(i)][$ "wh2"][0]+s.set.dlt[0]
        																	_xy4[3] = dbgxy[$string(i)][$ "xy4"][3]*dbgxy[$string(i)][$ "wh2"][1]+s.set.dlt[1]
        																	
        																	#region Draw Additional Vars
        																		
        																		#region Basics
        																			
        																			if(mouse_in_rectangle(_xy4)
        																				and variable_instance_exists(dbgxy[$string(i)],"hover")
        																				and variable_instance_exists(dbgxy[$string(i)],"find")) {
        																				
        																				if(dbgxy[$string(i)][$ "hover"]
        																					and p.search.on
        																						and (!dbgxy[$string(i)][$ "find"]
        																						or (dbgxy[$string(i)][$ "find"] // Ugly; is either needs to find and be found or doesn't need to be found at all while searching...
        																							and dbgxy[$string(i)][$ "found"]))) {
        																					
        																					if(variable_instance_exists(dbgxy[$string(i)],"str")) {
        																						
        																						if(dbgxy[$string(i)][$ "str"] != noone
        																							and is_string(dbgxy[$string(i)][$ "str"])) {
        																							
        																							#region Draw Hover/Found Messages on Cursor
        																								
        																								var _w = s.set.w/6
        																								var strw = string_width_ext(dbgxy[$string(i)][$ "str"],strH,_w)
        																								var strh = string_height_ext(dbgxy[$string(i)][$ "str"],strH,_w)
        																								
        																								// Draw and Reset
        																								var hvo = [draw_get_halign(),draw_get_valign()]
        																								var ao = draw_get_alpha()
        																								var hv = [fa_left,fa_top]
        																								var xx = wmx+strH
        																								var yy = wmy+strH
        																								if(xx+strw > ww) {
        																									hv[0] = fa_right
        																									xx = wmx-strH
        																								}
        																								if(yy+strh > wh) {
        																									hv[1] = fa_bottom
        																									yy = wmy-strH
        																								}
        																								draw_set_hvalign(hv)
        																								draw_text_ext_color(xx,yy,dbgxy[$string(i)][$ "str"],
        																									strH,_w,c.wht,c.wht,c.wht,c.wht,2/3)
        																								draw_set_hvalign(hvo)
        																								
        																							#endregion
        																							
        																						}
        																						
        																					}
        																					
        																					if(variable_instance_exists(dbgxy[$string(i)],"ent")
        																						and p.search.done) {
        																						
        																						if(dbgxy[$string(i)][$ "ent"] != noone
        																							and is_string(dbgxy[$string(i)][$ "ent"])) {
        																							
        																							#region Entity Spawn
        																								
        																								switch(dbgxy[$string(i)][$ "ent"]) {
        																									
        																									case "SniperLogBook": {
        																										
        																										if(!variable_instance_exists(s.set.entity,"SniperLogBook")) {
        																											
        																											var _xy = [irandom_range(_xy4[0],_xy4[2])-s.set.dlt[0],irandom_range(_xy4[1],_xy4[3])-s.set.dlt[1]]
        																											s.set.entity[$ "SniperLogBook"] = init_entity(_xy,"Armory Logbook",ent.game,room,s)
        																											var _ent = s.set.entity[$ "SniperLogBook"]
        																											_ent.gameObj = eSniperGame
        																											_ent.spr = sprLogBook
        																											_ent.sprRot = random_range(-45,45)
        																											_ent.state = ent.game
        																											_ent.durability = 1
        																											
        																										}
        																										break
        																										
        																									}
        																									
        																								}
        																								
        																							#endregion
        																							
        																						}
        																						
        																					}
        																					
        																				}
        																				
        																				// Found?
        																				if(dbgxy[$string(i)][$ "find"] and !dbgxy[$string(i)][$ "found"] and p.search.done)
        																					dbgxy[$string(i)][$ "found"] = t
        																				
        																			}
        																			
        																		#endregion
        																		
        																	#endregion
        																	
        																	// Reset alpha
        																	draw_set_alpha(ao)
        																	
        																#endregion
        																
        															} else {}
        															
        														#endregion
        														
        													}
        													
        												#endregion
        												
        											} else if(dbgxy[$string(i)][$ "shape"] == "circ") {
        												
        												#region Draw Debug XY Circles
        													
        													#region Inits
        														
        														var _xy2 = [dbgxy[$string(i)][$ "xy2"][0]*dbgxy[$string(i)][$ "wh2"][0]+s.set.dlt[0],
        															dbgxy[$string(i)][$ "xy2"][1]*dbgxy[$string(i)][$ "wh2"][1]+s.set.dlt[1]]
        														var _rad = real(dbgxy[$string(i)][$ "rad"])
        														
        														// Selected?
        														if(mouse_in_circle(_xy2,_rad) and mbmp) {
        															
        															keyboard_string = ""
        															dbgxysel = i
        															dbgxyi2 = i
        															
        														}
        														
        														// set rect alpha 20%
        														var ao = draw_get_alpha()
        														draw_set_alpha(1/5)
        														
        													#endregion
        													
        													#region Basics
        														
        														if(mouse_in_circle(_xy2,_rad)
        															and variable_instance_exists(dbgxy[$string(i)],"hover")
        																and variable_instance_exists(dbgxy[$string(i)],"find")) {
        															
        															if(dbgxy[$string(i)][$ "hover"]
        																and p.search.on
        																	and (!dbgxy[$string(i)][$ "find"]
        																	or (dbgxy[$string(i)][$ "find"] // Ugly; is either needs to find and be found or doesn't need to be found at all while searching...
        																		and dbgxy[$string(i)][$ "found"]))) {
        																
        																if(variable_instance_exists(dbgxy[$string(i)],"str")) {
        																	
        																	if(dbgxy[$string(i)][$ "str"] != noone
        																		and is_string(dbgxy[$string(i)][$ "str"])) {
        																		
        																		#region Draw Hover/Found Messages on Cursor
        																			
        																			var _w = s.set.w/6
        																			var strw = string_width_ext(dbgxy[$string(i)][$ "str"],strH,_w)
        																			var strh = string_height_ext(dbgxy[$string(i)][$ "str"],strH,_w)
        																			
        																			// Draw and Reset
        																			var hvo = [draw_get_halign(),draw_get_valign()]
        																			var ao = draw_get_alpha()
        																			var hv = [fa_left,fa_top]
        																			var xx = wmx+strH
        																			var yy = wmy+strH
        																			if(xx+strw > ww) {
        																				hv[0] = fa_right
        																				xx = wmx-strH
        																			}
        																			if(yy+strh > wh) {
        																				hv[1] = fa_bottom
        																				yy = wmy-strH
        																			}
        																			draw_set_hvalign(hv)
        																			draw_text_ext_color(xx,yy,dbgxy[$string(i)][$ "str"],
        																				strH,_w,c.wht,c.wht,c.wht,c.wht,2/3)
        																			draw_set_hvalign(hvo)
        																			
        																		#endregion
        																		
        																	}
        																	
        																}
        																
        															}
        															
        															// Found?
        															if(dbgxy[$string(i)][$ "find"] and !dbgxy[$string(i)][$ "found"] and p.search.done)
        																dbgxy[$string(i)][$ "found"] = t
        															
        														}
        														
        													#endregion
        													
        													// Reset Alpha
        													draw_set_alpha(ao)
        													
        												#endregion
        												
        											}
        											
        										}
        										
        									#endregion
        									
        								}
        								
        							#endregion
        							
        						}
        						
        					}
        					
        				}
        				
        			}
        			
        		#endregion
        		
        	#endregion
            
    	}
    	
	}
}