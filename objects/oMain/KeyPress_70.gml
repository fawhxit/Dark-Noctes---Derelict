/// @description Toggle Flashlight

if(state == game.play) {
	
	if(s.scene_inst == noone and !controlOverride) {
		
		#region Disable
			
			if(p.flash.disable) p.flash.on = f else {
				
				audio_play_sound_at(flashClick,0,0,0,5,32,1,f,5,1)
				p.flash.on = !p.flash.on
				
			}
			
		#endregion
		
		#region Enable
			
			if(p.flash.on) {
				
				var del_rng = p.flash.flick.del_rng
				var t_rng = p.flash.flick.dur_rng
				p.flash.flick.del = irandom_range(del_rng[0],del_rng[1])
				p.flash.flick.dur = irandom_range(t_rng[0],t_rng[1])
				p.flash.flick.deli = 0
				p.flash.flick.duri = 0
				
			}
			
		#endregion
		
	}

}