/// @description Debug Draws

if(dbg) {
	
	#region Debug String Setup
		
		// Toggle Debug String Drawing
		if(keyboard_check_pressed(vk_insert)) {
			
			if(dbgMode == dbgOpt.sz-1) dbgMode = dbgOpt.norm
			else dbgMode += 1
			
		}
		
		// Init Debug String to Draw
		var str = ""
		
		switch(dbgMode) {
			
			case dbgOpt.norm: {
				
				if(is2(s)) {
					
					// Scene
					str += "Scene: "+string(room_get_name(room))
						+"\nMouse Room X/Y: "+string("{0}/{1}",M.mx_pct*s.set.w,M.my_pct*s.set.h)
						+"\nRoom Width/Height: "+string("{0}/{1}",s.set.w,s.set.h)
					
				}
				
				// Basic Stuff
				if(str != "") str += "\n"
				str += "Mouse X/Y: "+string(wmx)+"/"+string(wmy)
					+"\nMouse PCT X/Y: "+string(wmx/ww)+"/"+string(wmy/wh)
					+"\nWindow W/H: "+string(ww)+"/"+string(wh)
					+"\nDisplay W/H: "+string(dw)+"/"+string(dh)
					+"\nSurface W/H: "+string(surface_get_width(application_surface))+"/"
						+string(surface_get_height(application_surface))
					+"\nRuntime: "+str_hou+"."+str_min
						+"."+str_sec+"."+str_fra
					+"\nTime Gate States h/m/s/f: "+string("{0}/{1}/{2}/{3}",hs,ms,ss,fs)
					+"\nDifficulty: "+string(monDif)
					+"\nDrop #: "+string(env.drop_num)
					+"\nWind Delta: "+string(env.wind_delta)
					+"\nFog #: "+string(env.fog_num)
					+"\nm.inst_l: "+string(ds_list_size(m.inst_l))
					+"\nFPS: "+string(fps)
					+"\ndlt_t s/us: "+string(dt)+"/"+string(delta_time)
					+"\ndbgEmtx: "+string(dbgEmtx)
					+"\nMon Count: "+string(monSz)
					+"\nMon List: "+string(monL[|0])
					+"\nMon Del/i: "+string("{0}/{1}",(monDel/60)/60,(monDeli/60)/60)
					+"\nMon Del mn/mx: "+string("{0}/{1}",monDelMn,monDelMx)
					+"\nFore active: "+string(p.fore.active)
					+"\nFore pct: "+string(p.fore.pct)
					+"\nFore zi: "+string(p.fore.zi(p.fore.zmn,p.fore.zmx,p.fore.pct))
					+"\nKiller: "+string(p.killer)
					+"\nsubGame: "+string(subGame)
				
				// Monster Stuff
				if(!ds_list_empty(monL)) {
					
					str += "\nMon x/y: "+string("{0}/{1}",monL[|0].x,monL[|0].y)
							+"\nMon xpct: "+string(monL[|0].xpct)
					if(monL[|0].mon1_emitter != noone)
						if(audio_emitter_exists(monL[|0].mon1_emitter))
							str += "\nMon Emitter x: "+string(audio_emitter_get_x(monL[|0].mon1_emitter))
					str += "\nMon Dist to Mouse X: "+string(point_distance(M.mx_pct*s.set.w,0,monL[|0].xx,0))
					str += "\nMon Bound X: "+string(monL[|0].boundx)
					str += "\nMon Behavior: "
					switch(monL[|0].behavior) {
						
						case mon.idle: str += "Idle"; break;
						case mon.fast: str += "Fast"; break;
						case mon.far: str += "Far"; break;
						case mon.close: str += "Close"; break;
						case mon.chase: str += "Chase"; break;
						case mon.creep: str += "Creep"; break;
						case mon.flee: str += "Flee"; break;
						default: str += "DEFAULT"; break;
						
					}
					str += "\nfkilli (eyes): "+string("{0}/{1}",monL[|0].eyes.fkilli,monL[|0].eyes.fkilld)
					str += "\nCloseness (eyes): "+string(monL[|0].eyes.dbgstr)
					str += "\nKill Alarm (eyes): "+string(monL[|0].eyes.alarm[0])
					
				}
				
				if(is2(subGame)) {
					
					str += "\n\nSUBGAME: "
					str += "\nAlarm 0: "+string(subGame.alarm[0])
					
				}
				
				break
				
			}
			
			case dbgOpt.xystruct: {
				
				if(is2(s)) {
					
					// Scene
					str += "Scene: "+string(room_get_name(room))
						+"\nMouse Room X/Y: "+string("{0}/{1}",M.mx_pct*s.set.w,M.my_pct*s.set.h)
						+"\nRoom Width/Height: "+string("{0}/{1}",s.set.w,s.set.h)
					
				}
				
				// Debug Editing?
				if(str != "") str += "\n"
				str += "Debug XY Struct Editing: "
				if(dbgxyOn) str += "On"
				else str += "Off"
				
				// Control Help
				str += "\nEdit Controls: (M)essage, To (R)oom"
					+"\n(F)ind, (H)over, (T)imer"
					+"\n(D)elay, (A)nimation, (S)prite"
					+"\nS(O)und"
				
				// Selected Entry's Struct
				str += "\n"+json_stringify(dbgxy[$ dbgxyi2],t)
				break
				
			}
			
			case dbgOpt.xyhelp: {
				
				
				if(is2(s)) {
					
					// Scene
					str += "Scene: "+string(room_get_name(room))
						+"\nMouse Room X/Y: "+string("{0}/{1}",M.mx_pct*s.set.w,M.my_pct*s.set.h)
						+"\nRoom Width/Height: "+string("{0}/{1}",s.set.w,s.set.h)
					
				}
				
				// Editing?
				if(str != "") str += "\n"
				str += "Debug XY Struct Editing: "
				if(dbgxyOn) str += "On"
				else str += "Off"
				
				// Controls
				str += "\nEdit Controls: (M)essage, To (R)oom"
					+"\n(F)ind, (H)over, (T)imer"
					+"\n(D)elay, (A)nimation, (S)prite"
					+"\nS(O)und"
				
				break
				
			}
			
			default:break // dbgOpt.hide
			
		}
		
	#endregion
	
	#region Debug XY Struct Logic || Dev Tool || For plotting Interaction nodes throught scenes into a json file (much needed) || Available during debug
		
		if(!variable_instance_exists(dbgxy,string(dbgxyi)) or dbgxy[$string(dbgxyi)] == noone)
			dbgxy[$string(dbgxyi)] = {} // Init Next Entry
		else {
			
			#region Debug XY Struct Editing Active || Entry Creation & Draw Logic
				
				// Toggle Debug XY Struct Editing...
				if(keyboard_check_pressed(vk_home)) dbgxyOn = !dbgxyOn
				
				if(dbgxyOn) {
					
					#region Debug XY Struct Editing Other Controls
						
						// If we mbmp outside all entries, this effectively acts as a deselect...
						if(mbmp) dbgxysel = noone
						
						if(keyboard_check_pressed(vk_pageup)) {
							
							// Iterate to next entry/instance of dbgxy(struct of structs) in debug viewer
							if(dbgxyi2 >= variable_instance_names_count(dbgxy)) dbgxyi2 = 0
							else dbgxyi2 += 1
							
						} else if(keyboard_check_pressed(vk_pagedown)) {
							
							// Iterate to previous entry/instance of dbgxy(struct of structs) in debug viewer
							if(dbgxyi2 <= 0) dbgxyi2 = variable_instance_names_count(dbgxy)
							else dbgxyi2 -= 1
							
						} else if(keyboard_check_pressed(vk_end)) {
							
							// Iterate New Entry Type
							dbgxyType += 1
							if(dbgxyType == xytype.sz)
								dbgxyType = xytype.txt
							
						} else if(keyboard_check_pressed(vk_delete)) {
							
							if(dbgxysel != noone) dbgxy[$string(dbgxysel)] = noone
							
						}
						
					#endregion
					
					#region Rectangle Entry (Left Click 2x for opposite corners to set)
						
						if(mblp) {
							
							#region Init Rectangle Entry (If New)
								
								if(!variable_instance_exists(dbgxy[$string(dbgxyi)],"room")) {
									
									dbgxy[$string(dbgxyi)][$ "room"] = room_get_name(room)
									dbgxy[$string(dbgxyi)][$ "typeA"] = dbgxyType
									dbgxy[$string(dbgxyi)][$ "shape"] = "rect"
									dbgxy[$string(dbgxyi)][$ "find"] = f
									dbgxy[$string(dbgxyi)][$ "hover"] = f
									
								}
								
							#endregion
							
							#region Set Coordinates
								
								// Ensure is Rectangle otherwise don't do anything
								if(dbgxy[$string(dbgxyi)][$ "shape"] == "rect") {
									
									if(!variable_instance_exists(dbgxy[$string(dbgxyi)],"xy4")) {
										
										// Set First Coordinate if xy4 doesn't even exist
										dbgxy[$string(dbgxyi)][$ "xy4"] = [wmx/ww,wmy/wh]
										dbgxy[$string(dbgxyi)][$ "wh2"]  = [s.set.w,s.set.h]
										
									} else if(array_length(dbgxy[$string(dbgxyi)][$ "xy4"]) == 2) {
										
										// xy4 exists and is size 2, so we set the 2nd coordinate
										dbgxy[$string(dbgxyi)][$ "xy4"][2] = wmx/ww
										dbgxy[$string(dbgxyi)][$ "xy4"][3] = wmy/wh
										
										// With 2nd Coordinate set, this entry is done aside from str entry
										// We iterate dbgxyi to go on to make the next entry
										dbgxyi += 1
										
									}
									
								}
								
							#endregion
							
						}
						
					#endregion
					
					#region Circle Entry (Right Click + Drag to set w/ size) (Like a Node)
						
						if(mbr) {
							
							if(mbrp) {
								
								#region Init Circle Entry (Should be new /*#as this*/ is all done with one click+drag)
									
									if(!variable_instance_exists(dbgxy[$string(dbgxyi)],"room")) {
										
										dbgxy[$string(dbgxyi)][$ "room"] = room_get_name(room)
										dbgxy[$string(dbgxyi)][$ "typeA"] = dbgxyType
										dbgxy[$string(dbgxyi)][$ "shape"] = "circ"
										dbgxy[$string(dbgxyi)][$ "find"] = f
										dbgxy[$string(dbgxyi)][$ "hover"] = f
										dbgxy[$string(dbgxyi)][$ "xy2"] = [wmx/ww,wmy/wh]
										dbgxy[$string(dbgxyi)][$ "wh2"]  = [s.set.w,s.set.h]
										dbgxy[$string(dbgxyi)][$ "rad"]  = 0
										
									}
									
								#endregion
								
							}
							
							#region Set circle size (RMB + Drag)
								
								// Ensure is Circle, otherwise don't do anything
								if(dbgxy[$string(dbgxyi)][$ "shape"] == "circ") {
									
									// Init xy2
									var _xy2 = [dbgxy[$string(dbgxyi)][$ "xy2"][0]*dbgxy[$string(dbgxyi)][$ "wh2"][0]+s.set.dlt[0],
										dbgxy[$string(dbgxyi)][$ "xy2"][1]*dbgxy[$string(dbgxyi)][$ "wh2"][1]+s.set.dlt[1]]
									
									// Adjust Radius/Size based on distance from initial click
									dbgxy[$string(dbgxyi)][$ "rad"] = point_distance(wmx,wmy,_xy2[0],_xy2[1])
									
								}
								
							#endregion
							
						} else if(mbrr) {
							
							#region Iterate/finish circle entry (RMB Release)
								
								if(variable_instance_exists(dbgxy[$string(dbgxyi)],"room"))
									if(dbgxy[$string(dbgxyi)][$ "shape"] == "circ")
										dbgxyi += 1
								
							#endregion
							
						}
						
					#endregion
					
					#region Draw Each Debug XY Entry per room & Edit/Control Logic
						
						// Loop through all the entries in dbgxy
						// (a struct of structs, each struct an entry with relevant data)
						for(var i = 0; i < variable_instance_names_count(dbgxy); i++) {
							
							// Skip deleted entries
							if(!is2(dbgxy[$string(i)])) continue
							
							// Is it an actual entry yet? If "room" ain't set then it ain't defined at all yet
							if(variable_instance_exists(dbgxy[$string(i)],"room")) {
								
								#region Ensure Toggle Variable Instances Exist in all entries
									
									if(!variable_instance_exists(dbgxy[$string(i)],"find"))
										dbgxy[$string(i)][$ "find"] = f
									if(!variable_instance_exists(dbgxy[$string(i)],"hover"))
										dbgxy[$string(i)][$ "hover"] = f
									
								#endregion
								
								#region Are we in the room?
									
									if(dbgxy[$string(i)][$ "room"] == room_get_name(room)) {
										
										#region What shape? Circle or Rectangle?
											
											if(variable_instance_exists(dbgxy[$string(i)],"shape")) {
												
												if(dbgxy[$string(i)][$ "shape"] == "rect") {
													
													#region Draw Debug XY Rectangles
														
														if(variable_instance_exists(dbgxy[$string(i)],"xy4")) {
															
															#region Init
																
																// Init (First coordinate)
																var _xy4 = [dbgxy[$string(i)][$ "xy4"][0]*dbgxy[$string(i)][$ "wh2"][0]+s.set.dlt[0],
																	dbgxy[$string(i)][$ "xy4"][1]*dbgxy[$string(i)][$ "wh2"][1]+s.set.dlt[1]]
																
																// Draw First Coordinate
																draw_circle_color(_xy4[0],_xy4[1],5,c_white,c_white,f)
																
															#endregion
															
															#region 2nd Coordinate?
																
																if(array_length(dbgxy[$string(i)][$ "xy4"]) == 4) {
																	
																	#region Do have 2nd Coordinate, Full Draw
																		
																		// Init 2nd Coordinate
																		_xy4[2] = dbgxy[$string(i)][$ "xy4"][2]*dbgxy[$string(i)][$ "wh2"][0]+s.set.dlt[0]
																		_xy4[3] = dbgxy[$string(i)][$ "xy4"][3]*dbgxy[$string(i)][$ "wh2"][1]+s.set.dlt[1]
																		
																		// Draw 2nd Coor
																		draw_circle_color(_xy4[2],_xy4[3],5,c_white,c_white,f)
																		
																		// If inside rectangle, select w/ middle mouse button
																		if(mouse_in_rectangle(_xy4) and mbmp) {
																			
																			keyboard_string = ""
																			dbgxysel = i
																			dbgxyi2 = i
																			
																		}
																		
																		// set rect alpha 20%
																		var ao = draw_get_alpha()
																		draw_set_alpha(1/5)
																		
																		// Selected or not?
																		if(dbgxysel == i) {
																			
																			// Selected (yellow)
																			draw_rectangle_color(_xy4[0],_xy4[1],_xy4[2],_xy4[3],
																				c.ylw,c.ylw,c.ylw,c.ylw,f)
																			
																		} else if(i == dbgxyi2) {
																			
																			// Debug Display (red)
																			draw_rectangle_color(_xy4[0],_xy4[1],_xy4[2],_xy4[3],
																				c.r,c.r,c.r,c.r,f)
																			
																		} else {
																			
																			// Unselected (white)
																			draw_rectangle_color(_xy4[0],_xy4[1],_xy4[2],_xy4[3],
																				c.wht,c.wht,c.wht,c.wht,f)
																			
																		}
																		
																		#region Draw Additional Vars
																			
																			// Init
																			var hvo = [draw_get_halign(),draw_get_valign()]
																			draw_set_hvalign([fa_center,fa_middle])
																			var _str = ""
																			var _str2 = ""
																			
																			#region Basics
																				
																				// String Draw
																				if(variable_instance_exists(dbgxy[$string(i)],"str")) {
																					
																					if(_str != "") _str += "\n"
																					_str += "str: \""+dbgxy[$string(i)][$ "str"]+"\""
																					
																				}
																				
																				// To_Room
																				if(variable_instance_exists(dbgxy[$string(i)],"to_room")) {
																					
																					if(_str != "") _str += "\n"
																					_str += "to_room: \""+dbgxy[$string(i)][$ "to_room"]+"\""
																					
																				}
																				
																			#endregion
																			
																			#region Toggles
																				
																				// Find?
																				if(variable_instance_exists(dbgxy[$string(i)],"find")) {
																					
																					if(dbgxy[$string(i)][$ "find"]) {
																						
																						if(_str2 != "") _str2 += ", "
																						_str2 += "Must Find"
																						
																					}
																					
																				}
																				
																				// Hover?
																				if(variable_instance_exists(dbgxy[$string(i)],"hover")) {
																					
																					if(dbgxy[$string(i)][$ "hover"]) {
																						
																						if(_str2 != "") _str2 += ", "
																						_str2 += "Hover"
																						
																					}
																					
																				}
																				
																			#endregion
																			
																			// Add to _str
																			if(_str2 != "") _str += "\n"+_str2
																			_str2 = "" // Reset
																			
																			#region Timer/Delay
																				
																				// Timer
																				if(variable_instance_exists(dbgxy[$string(i)],"timer")) {
																					
																					if(dbgxy[$string(i)][$ "timer"] != noone) {
																						
																						if(_str2 != "") _str2 += ", "
																						_str2 += "Timer: "+string(dbgxy[$string(i)][$ "timer"])
																						
																					}
																					
																				}
																				
																				// Delay
																				if(variable_instance_exists(dbgxy[$string(i)],"delay")) {
																					
																					if(dbgxy[$string(i)][$ "delay"] != noone) {
																						
																						if(_str2 != "") _str2 += ", "
																						_str2 += "Delay: " + string(dbgxy[$string(i)][$ "delay"])
																						
																					}
																					
																				}
																				
																			#endregion
																			
																			// Add to _str
																			if(_str2 != "") _str += "\n"+_str2
																			_str2 = "" // Reset
																			
																			#region Assets
																			
																				// Animation (A sprite w/ frames)
																				if(variable_instance_exists(dbgxy[$string(i)],"anim")) {
																					
																					if(dbgxy[$string(i)][$ "anim"] != noone) {
																						
																						if(_str2 != "") _str2 += ", "
																						_str2 += "Anim: " + string(dbgxy[$string(i)][$ "anim"])
																						
																					}
																					
																				}
																				
																				// Sprite
																				if(variable_instance_exists(dbgxy[$string(i)],"spr")) {
																					
																					if(dbgxy[$string(i)][$ "spr"] != noone) {
																						
																						if(_str2 != "") _str2 += ", "
																						_str2 += "Sprite: " + string(dbgxy[$string(i)][$ "spr"])
																						
																					}
																					
																				}
																				
																				// Sound
																				if(variable_instance_exists(dbgxy[$string(i)],"snd")) {
																					
																					if(dbgxy[$string(i)][$ "snd"] != noone) {
																						
																						if(_str2 != "") _str2 += ", "
																						_str2 += "SFX: " + string(dbgxy[$string(i)][$ "snd"])
																						
																					}
																					
																				}
																				
																			#endregion
																			
																			// Add to _str
																			if(_str2 != "") _str += "\n"+_str2
																			_str2 = "" // Reset
																			
																			// Entity
																			if(variable_instance_exists(dbgxy[$string(i)],"ent")) {
																				
																				if(dbgxy[$string(i)][$ "ent"] != noone) {
																					
																					if(_str2 != "") _str2 += ", "
																					_str2 += "Entity: " + string(dbgxy[$string(i)][$ "ent"])
																					
																				}
																				
																			}
																			
																			// Add to _str
																			if(_str2 != "") _str += "\n"+_str2
																			_str2 = "" // Reset
																			
																			// Draw and Reset
																			var _xx = lerp(_xy4[0],_xy4[2],1/2)
																			var _yy = lerp(_xy4[1],_xy4[3],1/2)
																			draw_text_color(_xx,_yy,_str,c.wht,c.wht,c.wht,c.wht,1)
																			draw_set_hvalign(hvo)
																			
																		#endregion
																		
																		// Reset alpha
																		draw_set_alpha(ao)
																		
																	#endregion
																	
																} else {
																	
																	#region No 2nd Entry yet... Maybe we want to cancel?
																		
																		// Don't have 2nd Coordinate?
																		if(keyboard_check_pressed(vk_backspace)) {
																			
																			// Delete/Cancel this Entry
																			dbgxy[$string(i)] = noone
																			
																		}
																		
																	#endregion
																	
																}
																
															#endregion
															
														}
														
													#endregion
													
												} else if(dbgxy[$string(i)][$ "shape"] == "circ") {
													
													#region Draw Debug XY Circles
														
														#region Inits
															
															var _xy2 = [dbgxy[$string(i)][$ "xy2"][0]*dbgxy[$string(i)][$ "wh2"][0]+s.set.dlt[0],
																dbgxy[$string(i)][$ "xy2"][1]*dbgxy[$string(i)][$ "wh2"][1]+s.set.dlt[1]]
															var _rad = real(dbgxy[$string(i)][$ "rad"])
															
															// Draw Coordinate
															draw_circle_color(_xy2[0],_xy2[1],3,c.r,c.r,f)
															
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
														
														#region Draw Radius
															
															if(i == dbgxysel) {
																
																// Selected, Draw Yellow
																// Draw Radius (Hilight)
																draw_circle_color(_xy2[0],_xy2[1],_rad,c.ylw,c.ylw,f)
																
															} else if(i == dbgxyi2) {
																
																// Displayed in Debug, Draw Red
																// Draw Radius (Hilight)
																draw_circle_color(_xy2[0],_xy2[1],_rad,c.r,c.r,f)
																
															} else {
																
																// Unselected, Draw White
																// Draw Radius (Hilight)
																draw_circle_color(_xy2[0],_xy2[1],_rad,c.wht,c.wht,f)
																
															}
															
														#endregion
														
														#region Draw Additional Vars
															
															// Init
															var hvo = [draw_get_halign(),draw_get_valign()]
															draw_set_hvalign([fa_center,fa_middle])
															var _str = ""
															var _str2 = ""
															
															#region Basics
																
																// String Draw
																if(variable_instance_exists(dbgxy[$string(i)],"str")) {
																	
																	if(_str != "") _str += "\n"
																	_str += "str: \""+dbgxy[$string(i)][$ "str"]+"\""
																	
																}
																
																// To_Room
																if(variable_instance_exists(dbgxy[$string(i)],"to_room")) {
																	
																	if(_str != "") _str += "\n"
																	_str += "to_room: \""+dbgxy[$string(i)][$ "to_room"]+"\""
																	
																}
																
															#endregion
															
															#region Toggles
																
																// Find?
																if(variable_instance_exists(dbgxy[$string(i)],"find")) {
																	
																	if(dbgxy[$string(i)][$ "find"]) {
																		
																		if(_str2 != "") _str2 += ", "
																		_str2 += "Must Find"
																		
																	}
																	
																}
																
																// Hover?
																if(variable_instance_exists(dbgxy[$string(i)],"hover")) {
																	
																	if(dbgxy[$string(i)][$ "hover"]) {
																		
																		if(_str2 != "") _str2 += ", "
																		_str2 += "Hover"
																		
																	}
																	
																}
																
															#endregion
															
															// Add to _str
															if(_str2 != "") _str += "\n"+_str2
															_str2 = "" // Reset
															
															#region Timer/Delay
																
																// Timer
																if(variable_instance_exists(dbgxy[$string(i)],"timer")) {
																	
																	if(dbgxy[$string(i)][$ "timer"] != noone) {
																		
																		if(_str2 != "") _str2 += ", "
																		_str2 += "Timer: "+string(dbgxy[$string(i)][$ "timer"])
																		
																	}
																	
																}
																
																// Delay
																if(variable_instance_exists(dbgxy[$string(i)],"delay")) {
																	
																	if(dbgxy[$string(i)][$ "delay"] != noone) {
																		
																		if(_str2 != "") _str2 += ", "
																		_str2 += "Delay: " + string(dbgxy[$string(i)][$ "delay"])
																		
																	}
																	
																}
																
															#endregion
															
															// Add to _str
															if(_str2 != "") _str += "\n"+_str2
															_str2 = "" // Reset
															
															#region Assets
															
																// Animation (A sprite w/ frames)
																if(variable_instance_exists(dbgxy[$string(i)],"anim")) {
																	
																	if(dbgxy[$string(i)][$ "anim"] != noone) {
																		
																		if(_str2 != "") _str2 += ", "
																		_str2 += "Anim: " + string(dbgxy[$string(i)][$ "anim"])
																		
																	}
																	
																}
																
																// Sprite
																if(variable_instance_exists(dbgxy[$string(i)],"spr")) {
																	
																	if(dbgxy[$string(i)][$ "spr"] != noone) {
																		
																		if(_str2 != "") _str2 += ", "
																		_str2 += "Sprite: " + string(dbgxy[$string(i)][$ "spr"])
																		
																	}
																	
																}
																
																// Sound
																if(variable_instance_exists(dbgxy[$string(i)],"snd")) {
																	
																	if(dbgxy[$string(i)][$ "snd"] != noone) {
																		
																		if(_str2 != "") _str2 += ", "
																		_str2 += "SFX: " + string(dbgxy[$string(i)][$ "snd"])
																		
																	}
																	
																}
																
															#endregion
															
															// Add to _str
															if(_str2 != "") _str += "\n"+_str2
															_str2 = "" // Reset
															
															// Entity
															if(variable_instance_exists(dbgxy[$string(i)],"ent")) {
																
																if(dbgxy[$string(i)][$ "ent"] != noone) {
																	
																	if(_str2 != "") _str2 += ", "
																	_str2 += "Entity: " + string(dbgxy[$string(i)][$ "ent"])
																	
																}
																
															}
															
															// Add to _str
															if(_str2 != "") _str += "\n"+_str2
															_str2 = "" // Reset
															
															// Draw and Reset
															draw_text_color(_xy2[0],_xy2[1],_str,c.wht,c.wht,c.wht,c.wht,1)
															draw_set_hvalign(hvo)
															
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
						
					#endregion
					
					#region Entry Edits (Selected and using hotkeys to set additional variables to an entry)
						
						if(is2(dbgxy[$string(dbgxysel)])) {
							
							if(dbgxyedit == noone) {
								
								#region Entry Edit Controls
									
									if(keyboard_check_pressed(ord("M"))) {
										
										#region Init Message(string) Edit
											
											dbgxyedit = xyedit.text
											if(variable_instance_exists(dbgxy[$string(dbgxysel)],"str"))
												keyboard_string = dbgxy[$string(dbgxysel)][$ "str"]
											else {
												
												keyboard_string = ""
												dbgxy[$string(dbgxysel)][$ "str"] = ""
												
											}
											
										#endregion
										
									} else if(keyboard_check_pressed(ord("R"))) {
										
										#region Init To_Room Edit
											
											dbgxyedit = xyedit.to_room
											if(variable_instance_exists(dbgxy[$string(dbgxysel)],"to_room"))
												keyboard_string = dbgxy[$string(dbgxysel)][$ "to_room"]
											else {
												
												keyboard_string = ""
												dbgxy[$string(dbgxysel)][$ "to_room"] = ""
												
											}
											
										#endregion
										
									} else if(keyboard_check_pressed(ord("F"))) {
										
										#region Init Findable Toggle
											
											keyboard_string = ""
											dbgxyedit = noone
											if(!variable_instance_exists(dbgxy[$string(dbgxysel)],"find")) dbgxy[$string(dbgxysel)][$ "find"] = t
											else dbgxy[$string(dbgxysel)][$ "find"] = !dbgxy[$string(dbgxysel)][$ "find"]
											
										#endregion
										
									} else if(keyboard_check_pressed(ord("H"))) {
										
										#region Init Hover Toggle
											
											keyboard_string = ""
											dbgxyedit = noone
											if(!variable_instance_exists(dbgxy[$string(dbgxysel)],"hover")) dbgxy[$string(dbgxysel)][$ "hover"] = t
											else dbgxy[$string(dbgxysel)][$ "hover"] = !dbgxy[$string(dbgxysel)][$ "hover"]
											
										#endregion
										
									} else if(keyboard_check_pressed(ord("T"))) {
										
										#region Timer
											
											dbgxyedit = xyedit.timer
											if(variable_instance_exists(dbgxy[$string(dbgxysel)],"timer"))
												keyboard_string = dbgxy[$string(dbgxysel)][$ "timer"]
											else {
												
												keyboard_string = ""
												dbgxy[$string(dbgxysel)][$ "timer"] = ""
												
											}
											
										#endregion
										
									} else if(keyboard_check_pressed(ord("D"))) {
										
										#region Delay
											
											dbgxyedit = xyedit.delay
											if(variable_instance_exists(dbgxy[$string(dbgxysel)],"delay"))
												keyboard_string = dbgxy[$string(dbgxysel)][$ "delay"]
											else {
												
												keyboard_string = ""
												dbgxy[$string(dbgxysel)][$ "delay"] = ""
												
											}
											
										#endregion
										
									} else if(keyboard_check_pressed(ord("A"))) {
										
										#region Animation
											
											dbgxyedit = xyedit.anim
											if(variable_instance_exists(dbgxy[$string(dbgxysel)],"anim"))
												keyboard_string = dbgxy[$string(dbgxysel)][$ "anim"]
											else {
												
												keyboard_string = ""
												dbgxy[$string(dbgxysel)][$ "anim"] = ""
												
											}
											
										#endregion
										
									} else if(keyboard_check_pressed(ord("S"))) {
										
										#region Sprite
											
											dbgxyedit = xyedit.spr
											if(variable_instance_exists(dbgxy[$string(dbgxysel)],"spr"))
												keyboard_string = dbgxy[$string(dbgxysel)][$ "spr"]
											else {
												
												keyboard_string = ""
												dbgxy[$string(dbgxysel)][$ "spr"] = ""
												
											}
											
										#endregion
										
									} else if(keyboard_check_pressed(ord("O"))) {
										
										#region Sound
											
											dbgxyedit = xyedit.snd
											if(variable_instance_exists(dbgxy[$string(dbgxysel)],"snd"))
												keyboard_string = dbgxy[$string(dbgxysel)][$ "snd"]
											else {
												
												keyboard_string = ""
												dbgxy[$string(dbgxysel)][$ "snd"] = ""
												
											}
											
										#endregion
										
									} else if(keyboard_check_pressed(ord("E"))) {
										
										#region Entity
											
											dbgxyedit = xyedit.ent
											if(variable_instance_exists(dbgxy[$string(dbgxysel)],"ent"))
												keyboard_string = dbgxy[$string(dbgxysel)][$ "ent"]
											else {
												
												keyboard_string = ""
												dbgxy[$string(dbgxysel)][$ "ent"] = ""
												
											}
											
										#endregion
										
									}
									
								#endregion
								
							} else {
								
								#region Confirm Input
									
									if(dbgxyedit == xyedit.text) { // String/Text Edit
										
										#region Message
											
											if(keyboard_check_pressed(vk_backspace)
												and dbgxy[$string(dbgxysel)][$ "str"] == "") {
												variable_struct_remove(dbgxy[$string(dbgxysel)],"str")
												dbgxyedit = noone
											} else dbgxy[$string(dbgxysel)][$ "str"] = keyboard_string
											
										#endregion
										
									} else if(dbgxyedit == xyedit.to_room) { // To_Room Edit
										
										#region To Room
											
											if(keyboard_check_pressed(vk_backspace)
												and dbgxy[$string(dbgxysel)][$ "to_room"] == "") {
												variable_struct_remove(dbgxy[$string(dbgxysel)],"to_room")
												dbgxyedit = noone
											} else dbgxy[$string(dbgxysel)][$ "to_room"] = keyboard_string
											
										#endregion
										
									} else if(dbgxyedit == xyedit.timer) { // Timer Edit
										
										#region Timer
											
											if(keyboard_check_pressed(vk_backspace)
												and dbgxy[$string(dbgxysel)][$ "timer"] == "") {
												variable_struct_remove(dbgxy[$string(dbgxysel)],"timer")
												dbgxyedit = noone
											} else dbgxy[$string(dbgxysel)][$ "timer"] = keyboard_string
											
										#endregion
										
									} else if(dbgxyedit == xyedit.delay) { // Delay Edit
										
										#region Delay
											
											if(keyboard_check_pressed(vk_backspace)
												and dbgxy[$string(dbgxysel)][$ "delay"] == "") {
												variable_struct_remove(dbgxy[$string(dbgxysel)],"delay")
												dbgxyedit = noone
											} else dbgxy[$string(dbgxysel)][$ "delay"] = keyboard_string
											
										#endregion
										
									} else if(dbgxyedit == xyedit.anim) { // Animation Edit
										
										#region Animation
											
											if(keyboard_check_pressed(vk_backspace)
												and dbgxy[$string(dbgxysel)][$ "anim"] == "") {
												variable_struct_remove(dbgxy[$string(dbgxysel)],"anim")
												dbgxyedit = noone
											} else dbgxy[$string(dbgxysel)][$ "anim"] = keyboard_string
											
										#endregion
										
									} else if(dbgxyedit == xyedit.spr) { // Sprite Edit
										
										#region Sprite
											
											if(keyboard_check_pressed(vk_backspace)
												and dbgxy[$string(dbgxysel)][$ "spr"] == "") {
												variable_struct_remove(dbgxy[$string(dbgxysel)],"spr")
												dbgxyedit = noone
											} else dbgxy[$string(dbgxysel)][$ "spr"] = keyboard_string
											
										#endregion
										
									} else if(dbgxyedit == xyedit.snd) { // Sound Edit
										
										#region Sound
											
											if(keyboard_check_pressed(vk_backspace)
												and dbgxy[$string(dbgxysel)][$ "snd"] == "") {
												variable_struct_remove(dbgxy[$string(dbgxysel)],"snd")
												dbgxyedit = noone
											} else dbgxy[$string(dbgxysel)][$ "snd"] = keyboard_string
											
										#endregion
										
									} else if(dbgxyedit == xyedit.ent) { // Entity Edit
										
										#region Entity
											
											if(keyboard_check_pressed(vk_backspace)
												and dbgxy[$string(dbgxysel)][$ "ent"] == "") {
												variable_struct_remove(dbgxy[$string(dbgxysel)],"ent")
												dbgxyedit = noone
											} else dbgxy[$string(dbgxysel)][$ "ent"] = keyboard_string
											
										#endregion
										
									}
									
									#region Finish Edit
										
										if(keyboard_check_pressed(vk_enter)) {
											
											if(dbgxyedit == xyedit.timer) {
												
												if(is_string_real(dbgxy[$string(dbgxysel)][$ "timer"]))
													dbgxy[$string(dbgxysel)][$ "timer"] = real(dbgxy[$string(dbgxysel)][$ "timer"])
												else variable_struct_remove(dbgxy[$string(dbgxysel)],"timer")
												
											} else if(dbgxyedit == xyedit.delay) {
												
												if(is_string_real(dbgxy[$string(dbgxysel)][$ "delay"]))
													dbgxy[$string(dbgxysel)][$ "delay"] = real(dbgxy[$string(dbgxysel)][$ "delay"])
												else variable_struct_remove(dbgxy[$string(dbgxysel)],"delay")
												
											}
											
											dbgxyedit = noone
											
										}
										
									#endregion
									
								#endregion
								
							}
							
						}
						
					#endregion
					
					#region Write everything to file
						
						if(keyboard_check(vk_control) and keyboard_check_pressed(vk_enter)) {
							
							var fl = file_text_open_write(game_save_id+"main.json")
							file_text_write_string(fl,json_stringify(dbgxy,t))
							file_text_close(fl)
							
						}
						
					#endregion
					
				}
				
			#endregion
			
		}
		
		
	#endregion
	
	#region Debug String Draw
		
		if(dbgMode != dbgOpt.hide) {
			
			var strw = string_width(str)
			var strh = string_height(str)
			draw_set_font(fMain)
			draw_set_hvalign([fa_left,fa_top])
			draw_set_alpha(0.5)
			draw_rectangle_color(0,0,strw+20,strh+20,c_dkgray,c_dkgray,
				c_black,c_black,f)
			draw_set_alpha(1)
			draw_text_color(10,10,str,c_white,c_white,c_white,c_white,1)
			
		}
		
	#endregion
	
}
