/// @description Reset/Destroy

// Ensure Killer Reset
p.killer = noone

if(mon1_emitter != noone){
	
	// Stop Audio
	if(audio_is_playing(sfx1))
		audio_stop_sound(sfx1)
	if(audio_is_playing(sfx2))
		audio_stop_sound(sfx2)
	
	// Destroy Emitter
	if(audio_emitter_exists(mon1_emitter))
		audio_emitter_free(mon1_emitter)
	mon1_emitter = noone
	
}

if(surface_exists(liteSurf)) {
	
	surface_free(liteSurf)
	liteSurf = noone
	
}