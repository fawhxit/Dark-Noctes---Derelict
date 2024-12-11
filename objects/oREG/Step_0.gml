/// @description Logic

#region Sound/Audio
	
	if(sndDeli >= sndDel and snd == noone
		and priSnd == noone and fd <= 0
		and randActive) {
		
		#region Random Sound to Play
			
			// Emitter Position
			if(!sndCenter) audio_emitter_position(emit,irandom_range(-64,64),0,0)
			else audio_emitter_position(emit,0,0,0)
			
			if(!env.outdoor and env.shelter) {
				
				#region Indoor Shelter
					
					switch(irandom(5)) {
						
						case 0: snd = audio_play_sound_on(emit,sndWoodCreaking1,f,20,random_range(1/3,1),0,1+random_range(-.1,0)); break
						case 1: snd = audio_play_sound_on(emit,sndWoodCreaking2,f,20,random_range(1/3,1),0,1+random_range(-.1,0)); break
						case 2: snd = audio_play_sound_on(emit,sndWoodCreaking3,f,20,random_range(1/3,1),0,1+random_range(-.1,0)); break
						case 3: snd = audio_play_sound_on(emit,sndWoodCreaking4,f,20,random_range(1/3,1),0,1+random_range(-.1,0)); break
						case 4: snd = audio_play_sound_on(emit,sndWoodCreaking5,f,20,random_range(1/3,1),0,1+random_range(-.1,0)); break
						case 5: snd = audio_play_sound_on(emit,sndWoodCreaking6,f,20,random_range(1/3,1),0,1+random_range(-.1,0)); break
						default: break
						
					}
					
				#endregion
				
			} else if(env.outdoor and env.shelter) {
				
				#region Outdoor Shelter
					
					
					
				#endregion
				
			} else if(env.outdoor and !env.shelter) {
				
				#region The Great Outdoors
					
					
					
				#endregion
				
			}
			
		#endregion
		
	} else if(priSnd != noone and !audio_is_playing(snd) and !audio_is_playing(priSndDel)) {
		
		if(priSndDel == doorMetalOC and !audio_is_playing(doorMetalClose)) {
			
			#region Priority Sound
				
				if(priDeli >= priDel and !audio_is_playing(priSnd) and !priStarted) {
					
					#region Priority Sound Start
						
						// Position Emitter
						if(!sndCenter) audio_emitter_position(emit,irandom_range(-64,64),0,0)
						else audio_emitter_position(emit,0,0,0)
						
						// Play Priority Sound
						audio_play_sound_on(emit,priSnd,priLoop,1,1)
						priStarted = t
						
					#endregion
					
				} else if((!audio_is_playing(priSnd) and priStarted)
					or priEnd) {
					
					#region Priority Sound End
						
						// Cancel (priEnd == t)
						if(audio_is_playing(priSnd)) audio_stop_sound(priSnd)
						
						// Priority Sound Done/Reset
						priSnd = noone
						priStarted = f
						priDeli = 0
						priLoop = f
						priDel = Gspd
						priEnd = f
						priSndDel = doorMetalOC
						sndCenter = f
						
					#endregion
					
				} else if(!priStarted) priDeli += 1
				
			#endregion
			
		}
		
	}
	
	if(snd != noone) {
		
		#region Random Sound End
			
			// Cancel Sound
			if(audio_is_playing(snd) and fd > 0) audio_stop_sound(snd)
			if(!audio_is_playing(snd)) snd = noone
			
		#endregion
		
	}
	
#endregion

#region Iterations
	
	// Sound/Audio
	if(sndDeli >= sndDel or !randActive) {
		
		// Reset Delay
		sndDel = Gspd*irandom_range(30,90)
		sndDeli = 0
		
	}
	if(fd <= 0 and priSnd == noone)sndDeli++
	
#endregion
