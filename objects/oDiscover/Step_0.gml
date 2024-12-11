
if(type == ntype.none) {
    
    #region Section Title Logic
        
        // Init keep flashlight off + delay + override
        // fd += 1
        // p.flash.on = f
        // M.controlOverride = t
        
        if(stDeli > stDel) {
            
            // Fadeout (2 Seconds) (both foreground and background)
            var ispd = (stDeli-stDel)/(Gspd*2)
            stFgc[0] = clamp(1-ispd,0,1)
            stBgc[0] = clamp(stFgc[0],0,1/3)
            
            if(M.gateSFX != noone and audio_is_playing(doorMetalOC)) {
                
                M.gateSFX.playSFXVol = max(.01,.05*ispd)
                
            }
            
        } else if(stDeli < stDel) {
            
            // Fade in (20% of total time) (only foreground)
            var ispd = stDeli/(stDel*.2)
            stFgc[0] = clamp(ispd,0,1)
            
            /*
            // Play Dong SFX
            if(stFgc[0] == 1 and !audio_is_playing(sndDiscover))
                audio_play_sound(sndDiscover,0,f,2/3,0,1-(M.monDif/20)) // As difficulty increases, Dongs get deeper/darker
            */
            
            if(M.gateSFX != noone and audio_is_playing(doorMetalOC)) {
                
                M.gateSFX.playSFXVol = .01
                
            }
            
        }
        
        // Iterate
        stDeli += 1
        
    #endregion Section Title Logic
    
}