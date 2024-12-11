/// @description Draw Overlay

if(in_room == room and ((active and overlay and (p.flash.on or p.flash.disable)
	and near_mouse(self,p.flash.rad)) or always_show) and cov.pct <= 0) {
	
	#region Interact
		
		if(mouse_in_rectangle([x-50,y-50,x+50,y+50]) and !p.inv_show) {
			
			// Init
			found = t
			overlay = t
			
			// BASIC TEST TODO TODO TODO
			// Do: Pick up Cartridge?
			// Do: Show Cartridge/Search Unknown?
			// Do: Cartridge load sound before playing
			// Do: Cartridge into inventory
			// Do: Stop/Interrupt Cartridge Playing
			// Do: Cartridge Stop/End Sound
			if(mblp) {
				
				if(audio_exists(snd)) {
					
					var e = instance_create_layer(0,0,"Logic",oLogPlayer)
					ds_list_add(M.logPlayList,e)
					e.snd = snd
					
				}
				instance_destroy(id)
				
			}
			
		}
		
	#endregion Interact
	
	gpu_set_blendmode(bm_normal)
	
	#region Sprite/Text
		
		if(spr2 != noone) {
			
			// Init
			var scl = scl_spr2win(spr,0.04)
			
			// Mouse Hovering == Hilite + Text
			var _a = 0
			if(mouse_in_rectangle([x-50,y-50,x+50,y+50])) {
				
				// Set Hilite Alpha
				_a = fgc[0]
				
				#region Draw Text (w/ Sprite)
					
					if(str != noone) {
						
						// Draw Text
						draw_set_font(fMain)
						draw_set_hvalign([fa_center,fa_middle])
						draw_text_ext_color(x,y-((sprite_get_height(spr2)*scl)),str,strH,rad*M.hRef,
							fgc[1],fgc[2],fgc[3],fgc[4],fgc[0])
						
					}
					
				#endregion Draw Text (w/ Sprite)
				
			}
			
			// Draw Sprite
			draw_sprite_ext(spr2,0,x,y,scl,scl,sprRot,c_grey,fgc[0])
			
		} else {
			
			#region Draw Text (No 2nd Sprite)
				
				if(str != noone) {
					
					// Draw Text
					draw_set_font(fMain)
					draw_set_hvalign([fa_center,fa_middle])
					if(spr != noone) {
						
						// Adjust for 1st Sprite
						draw_text_ext_color(x,y-((sprite_get_height(spr)*scl)),str,strH,rad*M.hRef,
							fgc[1],fgc[2],fgc[3],fgc[4],fgc[0])
							
					} else {
						
						// No Sprite at all
						draw_text_ext_color(x,y,str,strH,rad*M.hRef,
							fgc[1],fgc[2],fgc[3],fgc[4],fgc[0])
							
					}
					
				}
				
			#endregion Draw Text (No 2nd Sprite)
			
			// Make sure we have 1st sprite then draw it
			if(spr != noone) {
				
				// Draw Sprite
				draw_sprite_ext(spr,0,x,y,scl,scl,0,c_grey,fgc[0])
				
			}
			
		}
		
	#endregion
	
}