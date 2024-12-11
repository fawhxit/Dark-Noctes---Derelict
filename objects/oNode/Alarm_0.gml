/// @description Close door SFX
if(!sfx_done and !audio_is_playing(doorOpen)) {
	
	audio_play_sound_at(doorClose,-.5,0,0,5,32,1,f,21,1)
	alarm[0] = noone
	sfx_done = t
	alarm[1] = Gspd*12
	
} else alarm[0] = Gspd