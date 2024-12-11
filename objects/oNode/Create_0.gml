/// @description Init Node Vars

#region Basic
	
	xx = ww2
	yy = wh2
	rad = 100
	bgc = [1.0,c_black,c_white]
	fgc = [1.0,c_white,c_white,c_ltgray,c_ltgray]
	str = "Unk Node"
	state = verb2.none
	in_room = noone
	parent = noone
	active = f
	gui_draw = t
	edge = noone

#endregion

#region Additional
	
	xrng = [0.0,1.0]
	yrng = [0.0,1.0]
	xpct = 1.0
	ypct = 1.0
	can_find = t
	found = f
	to_room = noone
	lock_num = noone
	dynamic = f
	shift = t
	always_show = f
	doored = f
	sfx_done = f
	dpct = 0
	dpctmx = 0
	unlocked = f
	snd = noone
	sndLoop = f

#endregion

#region Triggers
	
	fxDecline = f
	fxAccept = f
	playSFX = noone
	playSFXNext = noone
	footSFX = footPlain
	
#endregion