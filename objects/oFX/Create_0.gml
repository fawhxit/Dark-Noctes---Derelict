/// @description Init Drawing

#region Basic
    
    // Meta
    active = t
	always = f
    hidden = f
    in_room = room
    parent = s
    ndx = array_length(variable_struct_get_names(FXS))
    
    // X/Y
    xrng = [.5,.5]
    yrng = [.5,.5]
    xpct = .5
    ypct = .5
    xx = 0
    yy = 0
    
#endregion

#region Light
    
    // Flags
    lt_active = f
    gl_active = f
    
    // Light (lt) (Smaller, Brighter)
    ltr     = 10            // Radius
    lta     = 1             // Alpha
    ltall   = 0             // Alpha Lower Limit
    ltaul   = 1             // Alpha Upper Limit
    ltai    = ITER.s3       // Alpha Iterator
    ltfx    = FX.STATIC     // FX Type
    ltc     = [c.wht,env.lights_current] // Color
    ltco    = ltc
    
    // Glow (gl) (Bigger, Dimmer)
    glrm    = 4             // Radius Multiplier
    glam    = 0.5           // Alpha Multiplier
	
	// Environmental Lighting
	envLighta = noone
	envLight = noone
	envBlend = noone
    
#endregion

#region SFX
    
    // Basic SFX
    acceptSFX = scanAccept
    declineSFX = scanDecline
    
    // Play Noise
	playEmt = noone
    playSFX = noone
    playSFXVol = .1
    playSFXPit = 1
    playSFXNext = noone
    playSFXVolNext = .1
    playSFXPitNext = 1
    playSFXD = f
	playSFXLoop = f
	playSFXPan = f
    
#endregion

#region Interaction
    
    // Scanning
    parentNode = noone
    interDo = f
    interDone = f
    isAccept = f
    unlocked = f
    
    interAcc_ltc = [c.lg,c.blk]
    interDec_ltc = [c.lr,c.blk]
    
#endregion

// Add to List
FXS[$ndx] = id