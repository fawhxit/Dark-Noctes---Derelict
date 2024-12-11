/// @description Init

#region Basic
    
    xx = ww2
    yy = wh2
    rad = 100
    bgc = [1.0,c_black,c_white]
    fgc = [1.0,c_white,c_white,c_ltgray,c_ltgray]
    str = noone
    state = ent.normal
    in_room = noone
    parent = noone
    active = y
    overlay = f
    spr = sprQuestion
    spr2 = sprCartridge
    sprRot = 0
    setDif = noone
    type = ntype.contextual
    
#endregion

#region Sounds
	
	snd = noone // Main sound
	sndSr = logStart
	sndL = logLoop
	sndSp = logEnd
	sndDel = Gspd/2
	sndDeli = 0
	sndStoppage = f
	sndQt = 0
	
#endregion

#region Additional
    
    xrng = [0.0,1.0]
    yrng = [0.0,1.0]
    xpct = 1.0
    ypct = 1.0
    can_find = t
    key_num = noone
    pct = 0
    del = Gspd/2
    deli = noone
    sfx_done = f
    always_show = f
    found = f
    dpct = 0
    
#endregion

// Frame Delay
fd = 4