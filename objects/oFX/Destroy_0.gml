/// @description Remove from List

try {
    
    FXS[$ndx] = noone
	
} catch(_ex) {
    
    show_debug_message("FXS; FX Struct Deletion Fail")
    show_debug_message(_ex)
    
}

// Destroy SFX Emitter
if(playEmt != noone) audio_emitter_free(playEmt)

if(playSFXNext != noone) {
	
	var efx = instance_create_layer(0,0,"fgc0",oFX)
	efx.playSFX = playSFXNext
	efx.playSFXVol = playSFXVolNext
	efx.playSFXPit = playSFXPitNext
	
}
