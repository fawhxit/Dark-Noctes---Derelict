
#region Play Log Sounds Logic
	
	if(M.logPlayList[|0] == id) {
	    
	    // Init Delay
	    if(!ready and alarm[0] < 0) alarm[0] = Gspd
	    else if(ready) {
	        
	        if(snd != noone) {
    	        
    	        if(!sndStart) {
    	            
    	            audio_play_sound_on(M.contextEmt,logStart,f,0,1)
    	            sndStart = t
    	            
    	        } else if(sndStart and !sndStartD and !audio_is_playing(logStart)) {
    	            
    	            sndStartD = t
    	            audio_play_sound_on(M.contextEmt,logLoop,t,0,2/3)
    	            audio_play_sound_on(M.contextEmt,snd,f,0,1)
    	            sndMid = t
    	            
    	        } else if(sndMid and !sndMidD and !audio_is_playing(snd)) {
    	            
    	            sndMidD = t
    	            audio_stop_sound(logLoop)
    	            audio_play_sound_on(M.contextEmt,logEnd,f,0,1)
    	            sndEnd = t
    	            
    	        } else if(sndEnd and !sndEndD and !audio_is_playing(logEnd)) sndEndD = t
    	        
	        }
	        
	        // Toggle Destroy when Done
	        if(sndEndD or snd == noone) instance_destroy(id)
	        
	    }
	    
	}
	
	
#endregion