/// @description Set View/Instance Enables

// Init & Schedule Room Resize
alarm[0] = 2
switch(room) {
	
	case rMenu: {
		
		if(!instance_exists(oMenu))
			instance_create_layer(0,0,"Logic",oMenu)
		
		break
		
	}
	
	default: {
		
		// Reset Fore when room changes
		p.fore.active = f
		p.fore.reset()
		
		if(playGateSFX) {
			
			gateSFX = instance_create_layer(0,0,"fgc0",oFX)
			gateSFX.playSFX = doorMetalOC
			gateSFX.playSFXVol = .8
			gateSFX.playSFXPit = .9
			gateSFX.playSFXNext = doorMetalClose
			gateSFX.playSFXVolNext = 1
			gateSFX.playSFXPitNext = .9
			playGateSFX = f
			
		}
		
	}
	
}