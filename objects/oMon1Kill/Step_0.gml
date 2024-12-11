/// @description Update Logic

// Init
var kfpct = kfi/kf
var scl1 = .01
var scl2 = 1
scl = lerp(scl1,scl2,kfpct)

// Ensure Audio Play
if(!audio_is_playing(sndMechBlair))
	audio_play_sound_on(gpar.mon1_emitter,
	sndMechBlair,f,14,2/3)

// Kill Draw Updates
image_index = 0
image_xscale = scl
image_yscale = scl
image_angle = krot
image_blend = c_white
image_alpha = kfpct

// Move Logic (Lerp to Middle)
x = lerp(x,ww2,1/3)
y = lerp(y,wh2,1/3)

#region Kill Iterator
	
	if(par.kill) {
		
		if(kfi > kf) game_end()
		
		// Iterate Kill Frame
		kfi += 1
		
	}
	
#endregion