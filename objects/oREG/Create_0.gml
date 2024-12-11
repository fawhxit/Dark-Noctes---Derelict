/// @description Random Event Generator

#region Sound/Audio Vars
	
	// Base Vars
	emit = audio_emitter_create()
	sndCenter = f
	
	// Random Sounds
	randActive = t
	snd = noone
	sndDel = Gspd*10
	sndDeli = 0
	
	// Priority Vars
	priSnd = noone
	priDel = Gspd
	priDeli = 0
	priStarted = f
	priLoop = f
	priEnd = f
	priSndDel = doorMetalOC
	
#endregion