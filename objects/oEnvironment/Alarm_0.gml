/// @description Play Thunder SFX

switch(irandom(2)) {
	
	case 0: {
		
		audio_play_sound_at(thunder1,random_range(-0.5,0.5),
			0,0,5,32,1,f,2,light_sfx_g,0,random_range(0.67,1.1))
		break
		
	}
	
	case 1: {
		
		audio_play_sound_at(thunder2,random_range(-0.5,0.5),
			0,0,5,32,1,f,2,light_sfx_g,0,random_range(0.67,1.1))
		break
		
	}
	
	case 2: {
		
		audio_play_sound_at(thunder3,random_range(-0.5,0.5),
			0,0,5,32,1,f,2,light_sfx_g,0,random_range(0.67,1.1))
		break
		
	}
	
}