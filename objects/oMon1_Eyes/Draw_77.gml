/// @description Blink Logic

#region Blinking
	
	switch(parent.behavior) {
		
		case mon.flee:
		case mon.fast: image_blend = c.wht; break;
		default: image_blend = c.r; break;
		
	}
	
	image_alpha = parent.image_alpha
	
	if(image_speed > 0 and image_index >= 6
		and !(image_speed == 0 and deli > 0)) {
		
		image_speed = 0
		deli = Gspd*random_range(1,5)
		
	} else if(image_speed < 0 and image_index <= 0
		and !(image_speed == 0 and deli > 0)) {
		
		image_speed = -image_speed
		deli = Gspd*random_range(.2,1)
		
	} else if(round(image_index) == 3 and chance(10)
		and !(image_speed == 0 and deli > 0)) {
		
		image_speed = 0
		deli = Gspd*random_range(.2,3)
		
	}
	
	if(image_speed == 0 and deli <= 0) {
		
		if(image_index >= 6) {
			
			image_speed = -1
			
		} else if(image_index <= 0) {
			
			image_speed = 1
			
		} else {
			
			if(flip()) image_speed = -1
			else image_speed = 1
			
		}
		
	} else deli--
	
#endregion

#region Kill Start Logic
	
	// Start Kill?
	if(alarm[0] == -1 and p.killer == noone) {
		
		switch(parent.behavior) {
			
			case mon.fast : {
				
				if(mouse_in_circle([parent.x,parent.y],max(20,p.flash.rad))) {
					
					fkilli -= 2
					dbgstr = "Safe"
					
				} else {
					
					// 2-3 seconds to Trigger
					fkilli += 1
					if(fkilli >= fkilld) {
						
						p.killer = id
						alarm[0] = Gspd*random(10)
						
					}
					dbgstr = "Danger"
					
				}
				
				fkilli = clamp(fkilli,0,fkilld)
				if(is2(parent.sfx2)) audio_sound_gain(parent.sfx2,(fkilli/fkilld)*3,0)
				break
				
			}
			
			case mon.creep: {
				
				if(p.flash.on and point_distance(x,y,wmx,wmy) < p.flash.rad
					and fi == 1 and image_index >= 0 and image_index <= 4 and chance(5)) {
					
					p.killer = id
					alarm[0] = max(Gspd*random(10),Gspd*3)
					
				}
				break
				
			}
			
			case mon.chase:
			case mon.flee : {
				
				// Cancel any kills
				p.killer = noone
				alarm[0] = -1
				break
				
			}
			
			case mon.idle :
			default: {
				
				if(fi == 1 and image_index >= 0 and image_index <= 4) {
					
					if(point_distance(parent.x,parent.y,rmx,rmy) <= max(10,p.flash.rad)
						and p.state != verb.hide_left and p.state != verb.hide_right) {
						
						// Direct
						if(chance(90) and p.flash.on)
							p.killer = id
						else if(chance(2/3) and !p.flash.on) // Light Off
							p.killer = id
						
						dbgstr = "Direct (67% on, 34% off)"
						
					} else if(point_distance(parent.x,parent.y,rmx,rmy) <= max(20,p.flash.rad*2)
						and p.state != verb.hide_left and p.state != verb.hide_right) {
						
						// Near
						if(chance(20) and p.flash.on)
							p.killer = id
						else if(chance(5) and !p.flash.on)
							p.killer = id
						
						dbgstr = "Near (20% on, 5% off)"
						
					} else if(x < ww and x > 0 and y < wh and y > 0
						and p.state != verb.hide_left and p.state != verb.hide_right) {
						
						// Far
						if(chance(10) and p.flash.on)
							p.killer = id
						else if(chance(0) and !p.flash.on)
							p.killer = id
						
						dbgstr = "Far (Flash On 10%, Flash Off 0%)"
						
					} else {
						
						// Hidden
						var _i = 0
						if(p.flash.on) _i = 3 // w/ Light?
						if(chance(_i)) p.killer = id
						
						dbgstr = "Hide (0% off 5% on)"
						
					}
					
					if(is2(p.killer)) alarm[0] = max(Gspd*random(10),Gspd*3)
					
				}
				
				break
				
			}
			
		}
		
	}
	
#endregion