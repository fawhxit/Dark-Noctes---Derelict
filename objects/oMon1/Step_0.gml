/// @description SFX Logic

// Logic Variables
xpct = xx/s.set.w
mxpct = point_distance(M.mx_pct*s.set.w,0,xx,0)/(s.set.w*1.34)
var xPol = xpct-0.5 // Polarity

// Updates
boundx = s.set.w*2

#region Object Active?
	
	if(active) {
		
		#region Emitter Logic
			
			#region Emitter 1
				
				if(mon1_emitter == noone) {
					
					#region Create Emitter
						
						// Init
						mon1_emitter = audio_emitter_create()
						
						#region Start Audio
							
							// Pyramid
							if(!audio_is_playing(pyramid))
								sfx1 = audio_play_sound_on(mon1_emitter,pyramid,t,6,1,0,1+random_range(-0.05,0.05))
							else sfx1 = pyramid
							
						#endregion
						
					#endregion
					
				} else {
					
					#region Unpause
						
						if(audio_is_paused(sfx1))
							audio_resume_sound(sfx1)
						
					#endregion
					
					#region Update Emitter (Based on Polarity)
						
						if(xPol > 0) {
							
							#region To the right (+)
								
								audio_emitter_position(mon1_emitter,mxpct*M.audLimx[1],0,0)
								audio_emitter_gain(mon1_emitter,lim2_pct(mxpct*M.audLimx[1],M.audLimx[0],0,M.audLimx[1],t))
								
							#endregion
							
						} else {
							
							#region To the left (-)
								
								audio_emitter_position(mon1_emitter,mxpct*M.audLimx[0],0,0)
								audio_emitter_gain(mon1_emitter,lim2_pct(mxpct*M.audLimx[0],M.audLimx[0],0,M.audLimx[1],t))
								
							#endregion
							
						}
						
					#endregion
					
				}
				
			#endregion
			
			#region Emitter 2
			
			if(mon2_emitter == noone
				and behavior == mon.fast) {
				
				#region Create Emitter
					
					// Init
					mon2_emitter = audio_emitter_create()
					if(behavior == mon.fast) audio_emitter_gain(mon2_emitter,1) // Normally 0 (Volume Down, turned up by triggers?)
					
					#region Start Audio
						
						// Whispers
						if(!audio_is_playing(whispers))
							sfx2 = audio_play_sound_on(mon2_emitter,whispers,t,7,0,0,1+random_range(-0.05,0.05))
						else sfx2 = whispers
						
					#endregion
					
				#endregion
				
			} else if(mon2_emitter != noone
				and behavior != mon.fast) {
				
				#region Destroy
					
					if(audio_is_playing(sfx2)) {
						
						// Turn Down sfx2 and turn it off.
						if(audio_emitter_get_gain(mon2_emitter) > 0.05) audio_emitter_gain(mon2_emitter,audio_emitter_get_gain(mon2_emitter)/2)
						else {
							
							// Finally destroy discarded emitter...
							audio_stop_sound(sfx2)
							audio_emitter_free(mon2_emitter)
							mon2_emitter = noone
							
						}
						
					}
					
				#endregion
				
			} else if(audio_emitter_exists(mon2_emitter)) {
				
				#region Unpause
					
					if(audio_is_paused(sfx2))
						audio_resume_sound(sfx2)
					
				#endregion
				
				#region Update Emitter (Based on Polarity)
					
					if(xPol > 0) {
						
						#region To the right (+)
							
							audio_emitter_position(mon2_emitter,mxpct*M.audLimx[1],0,0)
							audio_emitter_gain(mon2_emitter,lim2_pct(mxpct*M.audLimx[1],M.audLimx[0],0,M.audLimx[1],t))
							
						#endregion
						
					} else {
						
						#region To the left (-)
							
							audio_emitter_position(mon2_emitter,mxpct*M.audLimx[0],0,0)
							audio_emitter_gain(mon2_emitter,lim2_pct(mxpct*M.audLimx[0],M.audLimx[0],0,M.audLimx[1],t))
							
						#endregion
						
					}
					
				#endregion
				
			}
			
				
			#endregion
			
		#endregion
		
	} else {
		
		#region Pause SFX
			
			// Pause Audio
			if(audio_is_playing(sfx1))
				audio_pause_sound(sfx1)
			if(audio_is_playing(sfx2))
				audio_pause_sound(sfx2)
			
		#endregion
		
	}
	
#endregion