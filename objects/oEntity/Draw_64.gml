/// @description Draw Overlay

if(in_room == room and ((active and overlay and (p.flash.on or p.flash.disable)
	and near_mouse(self,p.flash.rad)) or always_show) and cov.pct <= 0) {
	
	gpu_set_blendmode(bm_normal)
	
	#region Sprite/Text
		
		if(spr != noone) {
			
			// TODOFIX
			// Init
			var scl = scl_spr2win(spr,0.1)
			var sprwh = [((sprite_get_width(spr)*scl)/2),((sprite_get_height(spr)*scl)/2)]
			var _r = sprwh[0]
			if(_r < sprwh[1]) _r = sprwh[1]
			
			#region Mouse Interact
				
				if(mouse_in_circle([x,y],_r) and !p.inv_show ) {
					
					#region Do Pickup
						
						found = t
						overlay = t
						if(mblr and pct >= 1.0 and state != ent.game) {
							
							var _i = get_empty_inv_slot()
							if(_i != noone) {
								
								p.inv[|_i] = id
								in_room = noone
								
							}
							
						}
						
						if(mblr and pct >= 1.0 and state == ent.game and !is2(M.subGame)) {
							
							gameObj = instance_create_layer(0,0,"Logic",gameObj)
							M.subGame = gameObj
							gameObj.active = t
							
						}
						
					#endregion
					
					#region Pickup SFX
						
						if(!mbl) {
							
							// Stop Sound
							if(audio_is_playing(bushRustle1))
								audio_stop_sound(bushRustle1)
							
							pct  = 0
							deli = 0
							
						} else {
							
							if(deli < del) {
								
								// Play grabbing sound
								if(!audio_is_playing(bushRustle1) and !sfx_done)
									audio_play_sound_at(bushRustle1,0,0,0,5,32,1,f,6,0.75,0,.85)
								else if(audio_is_paused(bushRustle1))
									audio_resume_sound(bushRustle1)
								
								// Iterate
								pct  = deli/del
								deli += 1
								
							} else if(deli >= del) pct = 1
							
						}
						
					#endregion
					
				}
				
			#endregion
			
			// Pick-up Indicator
			if(pct > 0) draw_circle_color(x,y,rad*pct,c_red,c_red,t)
			
			// Mouse Hovering == Hilite + Text
			var _a = 0
			
			#region Text
				
				if(mouse_in_circle([x,y],_r) and !p.inv_show) {
					
					// Set Hilite Alpha
					_a = fgc[0]
					
					// Draw Text
					draw_set_font(fMain)
					draw_set_hvalign([fa_center,fa_middle])
					draw_text_ext_color(x,y-((sprite_get_height(spr)*scl)),str,strH,rad*M.hRef,
						fgc[1],fgc[2],fgc[3],fgc[4],fgc[0])
					
				}
				
			#endregion
			
			#region Sprite
				
				draw_sprite_ext(spr,1,x,y,scl*1.2,scl*1.2,sprRot,c_ltgrey,_a)
				// Normal
				draw_sprite_ext(spr,0,x,y,scl,scl,sprRot,c_grey,fgc[0])
				
			#endregion
			
		} else {
			
			#region Text Only
				
				draw_set_font(fMain)
				draw_set_hvalign([fa_center,fa_middle])
				draw_text_ext_color(x,y,str,strH,rad*M.hRef,
					fgc[1],fgc[2],fgc[3],fgc[4],fgc[0])
				
			#endregion
			
		}
		
	#endregion
	
}