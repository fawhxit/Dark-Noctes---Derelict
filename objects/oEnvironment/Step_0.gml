/// @description Logic
	
	#region Drops/Rain/etc. Logic
		
		out_rain = (outdoor and !shelter)
		
		if(out_rain) {
			
			// Stop Shelter Rain
			if(!audio_is_paused(shelterRain))
				audio_pause_sound(shelterRain)
			
			// Play Outdoor Rain
			if(!audio_is_playing(outRainLoop))
				audio_play_sound_at(outRainLoop,0,0,0,5,32,1,t,0)
			else if(audio_is_paused(outRainLoop))
				audio_resume_sound(outRainLoop)
			if(!audio_is_playing(outWindLoop))
				audio_play_sound_at(outWindLoop,0,0,0,5,32,1,t,1)
			else if(audio_is_paused(outWindLoop))
				audio_resume_sound(outWindLoop)
			if(!audio_is_playing(outWindLoop2))
				audio_play_sound_at(outWindLoop2,0,0,0,5,32,1,t,1)
			else if(audio_is_paused(outWindLoop2))
				audio_resume_sound(outWindLoop2)
			
			// Update SFX
			audio_sound_pitch(outRainLoop,1+(abs(wind_delta)/4))
			audio_sound_gain(outRainLoop,(0.5+abs(wind_delta)/4),0)
			audio_sound_pitch(outWindLoop,1+(abs(wind_delta)/2))
			audio_sound_gain(outWindLoop,abs(wind_delta)/8,0)
			audio_sound_pitch(outWindLoop2,1+(abs(wind_delta)/2))
			audio_sound_gain(outWindLoop2,0.5+((wind_delta)/4),0)
			audio_listener_position(wind_delta,0,0)
			
			// Update Drop Num
			drop_num = instance_number(oDrop)
			
			// Drop Spawn Logic
			if(drop_num < drop_mn) {
			
				do {
					
					instance_create_layer(irandom(M.wRef),irandom(wh),"Environment",oDrop)
					drop_num += 1
					
				} until(drop_num > drop_mn*1.25)
				drop_deli = 0
				drop_del = irandom(4)
				
			} else if(drop_num < drop_mx and drop_deli >= drop_del) {
				
				repeat(irandom_range(4,16))
					instance_create_layer(irandom(M.wRef),-64*M.vRef,"Environment",oDrop)
				
				drop_deli = 0
				drop_del = irandom(4)
				
			}
			
			// Iterate
			drop_deli += 1
			
		} else if((outdoor and shelter)
			or (!outdoor and !shelter)) {
			
			// Stop Outside Rain
			if(!audio_is_paused(outRainLoop))
				audio_pause_sound(outRainLoop)
			if(!audio_is_paused(outWindLoop))
				audio_pause_sound(outWindLoop)
			
			// Play Shelter Rain
			if(!audio_is_playing(shelterRain))
				audio_play_sound_at(shelterRain,0,0,0,5,32,1,t,3)
			else if(audio_is_paused(shelterRain))
				audio_resume_sound(shelterRain)
			
				
			// Play Wind Loop 2
			if(!audio_is_playing(outWindLoop2))
				audio_play_sound_at(outWindLoop2,0,0,0,5,32,1,t,3)
			else if(audio_is_paused(outWindLoop2))
				audio_resume_sound(outWindLoop2)
			
			// Adjust Wind Loop 2
			if(shelter) {
				
				// Update 
				audio_sound_pitch(outWindLoop2,1+(abs(wind_delta)/4))
				audio_sound_gain(outWindLoop2,0.2+(abs(wind_delta)/10),0)
				audio_listener_position(wind_delta,0,0)
				
			} else {
				
				// Update 
				audio_sound_pitch(outWindLoop2,1+(abs(wind_delta)/4))
				audio_sound_gain(outWindLoop2,0.5+(abs(wind_delta)/10),0)
				audio_listener_position(wind_delta,0,0)
				
			}
			
			// Update 
			audio_sound_pitch(shelterRain,1+(abs(wind_delta)/4))
			audio_sound_gain(shelterRain,0.8+(abs(wind_delta)/10),0)
			audio_listener_position(wind_delta,0,0)
			
		} else if(!outdoor and shelter) {
			
			// Stop Outside Wind
			if(!audio_is_paused(outRainLoop))
				audio_pause_sound(outRainLoop)
			if(!audio_is_paused(outWindLoop))
				audio_pause_sound(outWindLoop)
			if(!audio_is_paused(outWindLoop2))
				audio_pause_sound(outWindLoop2)
			
			// Stop Shelter Rain
			if(!audio_is_paused(shelterRain))
				audio_pause_sound(shelterRain)
				
		}
		
	#endregion
	
	#region Cave
		
		// Cave
		if(cave) {
			
			// Play Outdoor Rain
			if(!audio_is_playing(hollowDark))
				audio_play_sound_at(hollowDark,0,0,0,5,32,1,t,0)
			else if(audio_is_paused(hollowDark))
				audio_resume_sound(hollowDark)
			if(!audio_is_playing(hollowDrip))
				audio_play_sound_at(hollowDrip,0,0,0,5,32,1,t,1)
			else if(audio_is_paused(hollowDrip))
				audio_resume_sound(hollowDrip)
			
			// Update SFX
			audio_sound_gain(hollowDark,0.2+(abs(wind_delta)/8),0)
			audio_sound_gain(hollowDrip,abs(wind_delta)/3,0)
			audio_listener_position(wind_delta,0,0)
			
		} else {
			
			// Stop Hollow
			if(!audio_is_paused(hollowDark))
				audio_pause_sound(hollowDark)
			if(!audio_is_paused(hollowDrip))
				audio_pause_sound(hollowDrip)
			
		}
		
	#endregion
	
	#region Colony Logic
		
		// Power
		if(power_main) {
			// TODO
		} else if(power_alert) {
			// TODO
		} else if(power_reserve) {
			
			if(!lights_override) {
				lights_a = 0.05
				lights_current = lights_red
			}
			if(!blend_override) blend_current = blend_red
			
		} else {
			
			if(!lights_override) {
				lights_a = 0.95
				lights_current = lights_off
			}
			if(!blend_override) blend_current = blend_off
			
		}
		
		// Station
		if(station) {
			
			// Play Outdoor Rain
			if(!audio_is_playing(colonyStation))
				audio_play_sound_at(colonyStation,0,0,0,5,32,1,t,0)
			else if(audio_is_paused(colonyStation))
				audio_resume_sound(colonyStation)
			
			/*
			if(!audio_is_playing(hollowDrip))
				audio_play_sound_at(hollowDrip,0,0,0,5,32,1,t,1)
			else if(audio_is_paused(hollowDrip))
				audio_resume_sound(hollowDrip)
			*/
			
			// Update SFX
			audio_sound_gain(colonyStation,0.75+(abs(wind_delta)/8),0)
			// audio_sound_gain(hollowDrip,abs(wind_delta)/3,0)
			// audio_listener_position(wind_delta,0,0)
			
		} else {
			
			// Stop Hollow
			if(!audio_is_paused(colonyStation))
				audio_pause_sound(colonyStation)
			
			/*
			if(!audio_is_paused(hollowDrip))
				audio_pause_sound(hollowDrip)
			*/
			
		}
		
	#endregion
	
	#region Fog Logic
		
		fog_num = instance_number(oFog)
		
		if(outdoor) {
		
			while(fog_num < fog_mn) {
			
				instance_create_layer(irandom_range(-ww/5,ww*1.2),
					irandom_range(M.hRef*0.5,M.hRef),"Environment",oFog)
				fog_num += 1
			
			}
		
		} else if(M.state == game.play) {
			
			while(fog_num < fog_mn/2) {
				
				instance_create_layer(irandom_range(-ww/5,ww*1.2),
					irandom_range(M.hRef*.5,M.hRef),"Environment",oFog)
				fog_num += 1
				
			}
			
		}
		
	#endregion
	
	#region Lightening Logic
		
		if(outdoor or overLtn) {
			
			if(light_deli >= light_del and light_leni == noone) {
				
				// X/Y
				light_x = irandom_range(0,M.wRef)
				light_y = irandom_range(0,M.hRef*0.2)
				
				// SFX
				light_sfx_done = (audio_is_playing(thunder1)
					or audio_is_playing(thunder2) or audio_is_playing(thunder3))
				
				// Del/Len
				light_deli = 0
				light_del = irandom_range(Gspd*5,Gspd*10)
				light_leni = 0
				light_len  = irandom_range(Gspd/3,Gspd*.67)
				
			} else if(light_leni != noone and light_leni <= light_len) {
				
				// Iterate Flicker
				if(light_flick_deli >= light_flick_del) {
					light_a = random_range(light_a_mn,light_a_mx)
					light_flick_deli = 0
					light_flick_del  = irandom_range(1,4)
				} else light_flick_deli += 1
				
				// Iterate Length
				if(light_leni >= light_len)
					light_leni = noone
				else light_leni += 1
				
			} else light_deli += 1
			
		} else light_leni = noone
		
	#endregion
	
#region Wind Polarity/Delta Update & Drop Dir
	
	if(fi == 0 and chance(25)) wind_pol = -wind_pol
	wind_delta = (sin(degtorad(frame)))*2
	drop_dir = 270+(wind_delta*10)
	
#endregion

#region Environment Frame Iterate
	
	if(outdoor) {
		
		if(fs) frame += 0.25*wind_pol
		if(ss) frame += 0.1*wind_pol
		if(ms) frame += 0.05*wind_pol
		
	} else {
		
		if(fs) frame += 0.125*wind_pol
		if(ss) frame += 0.05*wind_pol
		if(ms) frame += 0.025*wind_pol
		
	}
	
	if(frame > 359) frame -= 359
	else if(frame < 0) frame += 359

#endregion