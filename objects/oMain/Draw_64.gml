/// @description Disclaimer & Inventory

if(is2(subGame)) {
	
	try {
	
	switch(subGame.object_index) {
		
		case eSniperGame: {
			
			
			break
			
		}
		
		default: subGame = noone;
		
	}
	
	} catch(_ex) {
		
		show_debug_message("Subgame Crash!")
		show_debug_message(_ex)
		subGame = noone
		
	}
	
} else {
		
	#region Disclaimer
		
		if(room == rInit) {
			
			// Timer or Enter key action...
			if(rInitDeli >= rInitDel or keyboard_check_pressed(vk_anykey)) {
				
				// Iterate
				rIniti += 1
				rInitDeli = 0
				
				// Disclaimers Done; Goto Menu
				if(rIniti >= 3) room_goto(rMenu)
				
			}
			
			if(rIniti == 0) {
				
				// Draw Epilepsy Warning
				var scl = ww/sprite_get_width(sprEpil)
				draw_sprite_ext(sprEpil,0,ww/2,wh/2,scl,scl,0,c_white,.8)
				//if(!audio_is_playing(msxSkulton)) audio_play_sound(msxSkulton,0,f,1)
				rInitDeli++
				
			} else if(rIniti == 1) {
				
				// Draw Ideal
				var scl = ww/sprite_get_width(sprIdeal)
				draw_sprite_ext(sprIdeal,0,ww/2,wh/2,scl,scl,0,c_white,.8)
				rInitDeli++
				
			} else if(rIniti == 2) {
				
				// Draw Studio Card
				if(startPol) lgRot -= .01
				else lgRot += .01
				var scl = (wh*.67)/sprite_get_height(sprStudio)
				draw_sprite_ext(sprStudio,0,ww/2,wh/2,scl,scl,lgRot,c_white,.8)
				rInitDeli++
				rInitDel = Gspd*3
				
			}
			
		}
		
	#endregion
	
	#region Inventory
		
		if(p.inv_show and M.state == game.play) {
			
			// Fadeout Scene
			draw_set_alpha(0.5)
			draw_rectangle_color(0,0,ww,wh,
				c_black,c_black,c_black,c_black,f)
			
			var l_sz = ds_list_size(p.inv)
			for(var i = 0; i < p.inv_size; i++) {
				
				#region Init
					
					// Init Element
					var e = noone
					if(i < l_sz) e = p.inv[|i]
					
					// Init Slots
					var WH = ww8
					var xy = [(i*WH)+5,(wh-WH)+5,((i+1)*WH)-5,wh-5,]
					draw_set_alpha(1)
					draw_rectangle_color(xy[0],xy[1],xy[2],xy[3],
						c_white,c_white,c_dkgray,c_dkgray,t)
					
				#endregion
				
				#region Draw Item in Slot
					
					try {
					
						if(e != noone) {
							
							// Init X/Y
							var _xx = lerp(xy[0],xy[2],0.5)
							var _yy = lerp(xy[1],xy[3],0.5)
							
							if(!is2(e.spr)) {
								
								// Question Mark
								var _scl = scl_spr2wh(sprQuestion,[WH,WH],.8)
								draw_sprite_ext(sprQuestion,0,_xx,_yy,_scl,_scl,0,c_white,.5)
								// Text
								draw_set_hvalign([fa_center,fa_middle])
								draw_text_ext_color(_xx,_yy,e.str,strH,WH-10,
									c_dkgray,c_dkgray,c_white,c_white,1)
								
							} else {
								
								// Sprite
								var _scl = scl_spr2wh(e.spr,[WH,WH],.8)
								draw_sprite_ext(e.spr,0,_xx,_yy,_scl,_scl,0,c_white,1)
								// And Text
								draw_set_hvalign([fa_center,fa_middle])
								draw_text_ext_color(_xx,_yy,e.str,strH,WH-10,
									c_dkgray,c_dkgray,c_white,c_white,1)
								
							}
							
						}
						
					} catch(_ex) {
						
						show_debug_message(_ex)
						
					}
					
				#endregion
				
				if(mouse_in_rectangle(xy)) {
					
					#region Hilight
						
						// Hilight Alpha
						if(mbl) draw_set_alpha(.25)
						else draw_set_alpha(0.5)
						
						// Draw Hilight
						draw_rectangle_color(xy[0],xy[1],xy[2],xy[3],
							c_gray,c_gray,c_gray,c_gray,f)
						
					#endregion
					
					#region Inventory Slots Interaction
						
						if(mblp and e != noone
							and fd == 0) {
							
							if(p.in_hand != noone) {
								
								// Swap w/ Slot
								var tmp = p.in_hand
								p.in_hand = e
								p.inv[|i] = tmp
								fd = 4
								break
								
							} else {
								
								// Take from Slot
								p.in_hand = e
								p.inv[|i] = noone
								fd = 4
								break
								
							}
							
						} else if(mblp and e == noone and fd == 0) {
							
							// Put into Empty Slot
							if(p.in_hand != noone) {
								
								p.inv[|i] = p.in_hand
								p.in_hand = noone
								fd = 4
								break
								
							}
							
						}
						
					#endregion
					
				}
				
			}
			
			// Return/Drop Item in Hand
			return_drop_item()
			
			#region Resource Inventory DISABLED
				
				/*
				var str = "Your Inventory:"
				+"\n"
				+"\nTotal Weight: "+string(p.res_inv.wt_tot)+"/"+string(p.res_inv.wt_mx)
				+"\nLegend: "+"(Quantity) * (Weight) = (Subtotal)"
				+"\n"
				+"\nUnknown: "+string(p.res_inv.unknown.num)+" * "+string(p.res_inv.unknown.wt)
					+" = "+string(p.res_inv.unknown.wt_tot)
				+"\nInorganic: "+string(p.res_inv.inorganic.num)+" * "+string(p.res_inv.inorganic.wt)
					+" = "+string(p.res_inv.inorganic.wt_tot)
				+"\nOrganic: "+string(p.res_inv.organic.num)+" * "+string(p.res_inv.organic.wt)
					+" = "+string(p.res_inv.organic.wt_tot)
				+"\nStone: "+string(p.res_inv.stone.num)+" * "+string(p.res_inv.stone.wt)
					+" = "+string(p.res_inv.stone.wt_tot)
				+"\nPlant: "+string(p.res_inv.plant.num)+" * "+string(p.res_inv.plant.wt)
					+" = "+string(p.res_inv.plant.wt_tot)
				+"\nWood Log: "+string(p.res_inv.wood_log.num)+" * "+string(p.res_inv.wood_log.wt)
					+" = "+string(p.res_inv.wood_log.wt_tot)
				+"\nWood Scrap: "+string(p.res_inv.wood_scrap.num)+" * "+string(p.res_inv.wood_scrap.wt)
					+" = "+string(p.res_inv.wood_scrap.wt_tot)
				var a = 1.0
				draw_set_hvalign([fa_left,fa_top])
				draw_text_ext_color(50,50,str,strH,wh*0.333,c_white,c_white,c_black,c_black,a)
				*/
				
			#endregion
			
		}
		
	#endregion
	
}