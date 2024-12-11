/// @description Draw Node (GUI)

if(in_room == room and ((active and (p.flash.on or p.flash.disable)
	and near_mouse(self,p.flash.rad)) or always_show) and cov.pct <= 0
	and gui_draw) {
	
	if(mouse_in_rectangle([x-50,y-50,x+50,y+50]) and fd == 0 and !p.inv_show) {
		
		if(mblr and ((lock_num == noone
			and to_room != noone
			and found) or unlocked)) {
			
			if(doored and !(audio_is_playing(doorOpen) or audio_is_playing(doorClose))) {
				
				audio_play_sound_at(doorOpen,1,0,0,5,32,1,f,20,1)
				alarm[0] = Gspd*random_range(4,8)
				
			}
			
			var efx = instance_create_layer(0,0,"fgc0",oFX)
			efx.playSFX = footSFX
			efx.playSFXVol = 2
			efx.playSFXPit = random_range(.8,1)
			efx.always = t
			
			if(snd != noone) {
				
				M.reg.priSnd = snd
				M.reg.priDel = 0
				M.reg.priLoop = sndLoop
				M.reg.sndCenter = t
				
			}
			
			room_goto(to_room)
			fd = 4
			
		} else if(mblr and lock_num != noone
			and to_room != noone
			and found) {
			
			if(p.in_hand != noone
				and p.in_hand.key_num == lock_num) {
				
				p.in_hand = noone
				fd = 4
				fxAccept = t
				
				if(snd != noone) {
					
					M.reg.priSnd = snd
					M.reg.priDel = 0
					M.reg.priLoop = sndLoop
					M.reg.sndCenter = t
					
				}
				
				// Game End
				if(lock_num == 5)
					room_goto(rFin)
				
			} else fxDecline = t
			
		} else if(mblr and to_room == noone) {
			
			var efx = instance_create_layer(0,0,"fgc0",oFX)
			efx.playSFX = doorMetalBang
			efx.playSFXVol = 2/3
			efx.playSFXPit = random_range(.8,1)
			
		}
		
	}
	
	gpu_set_blendmode(bm_normal)
	
	// Text
	draw_set_font(fMain)
	draw_set_hvalign([fa_center,fa_middle])
	draw_text_ext_color(x,y,str,strH,rad,
		fgc[1],fgc[2],fgc[3],fgc[4],fgc[0])
	
}