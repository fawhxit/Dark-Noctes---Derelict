/// @description Logic
// Init Logical Vars
var mxpct = 1-(point_distance(M.mx_pct*s.set.w,0,xx,0)/(s.set.w*.8))
var mypct = 1-(point_distance(0,M.my_pct*s.set.h,0,yy)/(s.set.h*.8))
var mpct = (mxpct+mypct)/2 // Percent Relative of Mouse Proximity to Self in Scene

#region Play SFX
    
    try {
	    
	    if(playSFX != noone) {
			
			if(playEmt == noone) playEmt = audio_emitter_create()
	    	
	    	if(audio_exists(playSFX) and !playSFXD) {
    			
    			if(playSFX == doorMetalOC) {
    				
    				if(audio_is_playing(playSFX)) audio_stop_sound(playSFX)
    				audio_play_sound(playSFX,4,f,.05)
    				
    			} else {
	    			
		    		// Play SFX
		    		if(audio_is_playing(playSFX)) audio_stop_sound(playSFX)
		    		audio_play_sound_on(playEmt,playSFX,playSFXLoop,4)
		    		
    			}
	    		
	    		// Done (So we don't repeat)
	    		playSFXD = t
	    		
	    	} else if (playSFXD and !audio_is_playing(playSFX) and !playSFXLoop)
				alarm[4] = 1 // One-time Sound
			
			#region SFX Updates
				
				if(playSFXPan and audio_emitter_exists(playEmt) and audio_is_playing(playSFX)) {
					
					#region Panoramic Emitter
						
						if(M.mx_pct < xpct) {
							
							#region To the right (+)
								
								audio_emitter_position(playEmt,M.audLimx[1]-(mpct*M.audLimx[1]),0,0)
								audio_emitter_gain(playEmt,lim2_pct(M.audLimx[1]-(mpct*M.audLimx[1]),M.audLimx[0],0,M.audLimx[1],t)*playSFXVol)
								
							#endregion
							
						} else {
							
							#region To the left (-)
								
								audio_emitter_position(playEmt,M.audLimx[0]-(mpct*M.audLimx[0]),0,0)
								audio_emitter_gain(playEmt,lim2_pct(M.audLimx[0]-(mpct*M.audLimx[0]),M.audLimx[0],0,M.audLimx[1],t)*playSFXVol)
								
							#endregion
							
						}
						
					#endregion
					
				} else if(audio_emitter_exists(playEmt)) audio_emitter_gain(playEmt,playSFXVol) // Simple/Direct Sound
				
				// Apply Pitch
				if(audio_emitter_exists(playEmt)) audio_emitter_pitch(playEmt,playSFXPit)
				
			#endregion
			
	    }
	    
    } catch(_ex) {
    	
    	show_debug_message("PLAY SFX ERR")
    	show_debug_message(_ex)
    	
    }
    
#endregion

#region Interaction Updates
    
    if(is(parentNode,oNode,f,f)
        and !interDo and !interDone) {
        
        var en = parentNode
        
        if(en.fxDecline) {
            
            if(!audio_is_playing(declineSFX))
				audio_play_sound_at(declineSFX,0,0,0,5,32,5,f,5,.67)
			
			alarm[0] = (audio_sound_length(declineSFX)*Gspd)/2
			alarm[2] = (audio_sound_length(declineSFX)*Gspd)*1.5
            
            interDo = t
            
        } else if(en.fxAccept) {
            
            if(!audio_is_playing(acceptSFX))
				audio_play_sound_at(acceptSFX,0,0,0,5,32,5,f,5,.67)
			
			alarm[1] = (audio_sound_length(acceptSFX)*Gspd)/2
			alarm[2] = (audio_sound_length(acceptSFX)*Gspd)*1.5
            
            isAccept = t
            interDo = t
            unlocked = t
            en.unlocked = t
            
        }
        
    } else if(interDone) {
        
        isAccept = f
        interDo = f
        interDone = f
        ltc = ltco
        if(unlocked) ltc = interAcc_ltc
        
    }
    
#endregion

if(is(id,oFX,t,t)) {
    
    #region Basic Updates
        
        if(parent != noone) {
			
			#region Cover/Uncover Position Adjusts
				
				if(cov.pct <= 0) {
					
					#region No Cover Position Adjust
						
						xx = parent.set.w*xpct
						yy = parent.set.h*ypct
						xx += parent.set.dlt[0]
						yy += parent.set.dlt[1]
						
					#endregion
					
				} else {
					
					#region Cover Position Adjust
						
						// X
						if(cov.left or cov.last_cover == verb.hide_left) // Hide Left
							xx = (s.set.dlt[0]*(1-(0.75*cov.pct)))+(parent.set.w*xpct)
						else if(cov.right or cov.last_cover == verb.hide_right) // Hide Right
							xx = ((s.set.dlt[0]*(1-(0.75*cov.pct)))+s.set.dlt_mx[0]*(0.75*cov.pct))+(parent.set.w*xpct)
						
						// Y
						yy = ((s.set.dlt[1]*(1-(0.75*cov.pct)))+(s.set.dlt_mx[1]*(0.75*cov.pct)))+(parent.set.h*ypct)
						
					#endregion
					
				}
			
			#endregion
			
        }
        
    #endregion
    
    #region Light Updates
        
        if(lt_active) {
            
            if(ltfx == FX.FLASH) {
                
                lta = clamp(lta+ltai,ltall,ltaul)
                if(lta >= ltaul and ltai > 0) ltai*=-1
                else if(lta <= ltall and ltai < 0) ltai*=-1
                
            }
            
        }
        
    #endregion
	
	#region Environmental Overrides
		
		// Light Overrides
		if(envLighta != noone) {
			
			// Light(or Darkness) Alpha
			env.lights_override = t
			env.lights_a = envLighta
			
		}
		if(envLight != noone) {
			
			// Light(or Darkness) Setting
			env.lights_override = t
			env.lights_current = envLight
			
		}
		
		// Blend Override
		if(envBlend != noone) {
			
			env.blend_override = t
			env.blend_current = envBlend
			
		}
	
	#endregion
    
}