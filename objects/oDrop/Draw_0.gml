/// @description Draw/Logic

var bounce = f
if(env.outdoor and !do_fx and room != rMenu) {
	
	// Destroy if below view/Hit Bot
	if(y >= wh+(100*rel_factor)
		or (bounced and (x > M.wRef+(200*M.vRef
		or x < -(200*M.vRef)))))
		instance_destroy(self)
	else if(y >= rel_bottom) {
		
		switch(fx) {
			
			case vfx.splash: {

				image_index = 5
				image_angle = 270
				image_speed = .5
				do_fx = t
				break
				
			}
			
			case vfx.fade: {
				
				do_fx = t
				break
				
			}
			
			case vfx.bounce: {
				
				bounce = t
				bounced = t
				break
				
			}
			
		}
		
	}
	
	// Accel
	if(!bounced) vel = clamp(vel+(acc*(abs(env.wind_delta/2)-.5)),vel_mn,vel_mx)
	else vel = clamp(vel+(acc*(abs(env.wind_delta/2)-.5)),vel_mn,vel_mx)
	
	// Apply Wind to Angle
	if(high_drag) image_angle += ((env.wind_delta*10))/(Gspd*3)
	else image_angle += ((env.wind_delta*10))/(Gspd*1.5)
	
	if(high_drag and !bounced) xx += (cos(degtorad(image_angle))*vel)*2
	else if(high_drag) xx += (cos(degtorad(image_angle))*vel)
	else xx += (cos(degtorad(image_angle))*vel)
	if(bounce) {
		
		if(image_angle <= 270) image_angle = lerp(image_angle,180,0.75)
		else image_angle = lerp(image_angle,359,0.75)
		bounce_vel = (-sin(degtorad(image_angle))*(vel))+random_range(0,2)
		
	} else if(!bounced)
		yy += (-sin(degtorad(image_angle))*vel)
	if(bounced) {
		yy -= bounce_vel
		bounce_vel -= acc
	}
	if(cov.pct <= 0) {
			
		x = s.set.dlt[0]+xx
		y = s.set.dlt[1]+yy
			
	} else {
			
		if(cov.left or cov.last_cover == verb.hide_left)
			x = (s.set.dlt[0]*(1-(0.75*cov.pct)))+xx
		else if(cov.right or cov.last_cover == verb.hide_right)
			x = ((s.set.dlt[0]*(1-(0.75*cov.pct)))+s.set.dlt_mx[0]*(0.75*cov.pct))+xx
		y = ((s.set.dlt[1]*(1-(0.75*cov.pct)))+(s.set.dlt_mx[1]*(0.75*cov.pct)))+yy
			
	}
	
	// Superficial Rotate and Draw
	if(high_drag) rot += -env.wind_delta*2
	image_angle += rot
	draw_self()
	image_angle -= rot
	
} else if(env.outdoor and do_fx and room != rMenu) {
	
	switch(fx) {
			
		case vfx.splash: {
			
			if(image_index >= 9) instance_destroy(self)
			break
				
		}
		
		case vfx.fade: {
			
			image_alpha -= fade_spd
			if(image_alpha <= 0) instance_destroy(self)
			break
			
		}
			
	}
	
	// Update XY
	if(cov.pct <= 0) {
			
		x = s.set.dlt[0]+xx
		y = s.set.dlt[1]+yy
			
	} else {
			
		if(cov.left or cov.last_cover == verb.hide_left)
			x = (s.set.dlt[0]*(1-(0.75*cov.pct)))+xx
		else if(cov.right or cov.last_cover == verb.hide_right)
			x = ((s.set.dlt[0]*(1-(0.75*cov.pct)))+s.set.dlt_mx[0]*(0.75*cov.pct))+xx
		y = ((s.set.dlt[1]*(1-(0.75*cov.pct)))+(s.set.dlt_mx[1]*(0.75*cov.pct)))+yy
			
	}
	
	draw_self()
	
}

/* LEGACY

if(env.outdoor) {
	
	#region Calc Velocity
		
		xvel = (cos(degtorad(image_angle))*(vel*env.wind_delta))
		yvel = (-sin(degtorad(image_angle))*(vel*env.wind_delta))
		if(!hard_fall) xvel += accel
		xx += xvel
		yy += yvel
		
	#endregion
	
	
	// Clamp Image Angles
	
	if(!hard_fall) image_angle += (env.wind_delta*rel_invert)*2
	else image_angle += (env.wind_delta*rel_invert)
	if((image_angle <= 190 and env.wind_delta < 0)
		or (image_angle >= 350 and env.wind_delta > 0))
		rel_invert = -rel_invert
	
	#region Calc Rotation
		
		if(!hard_fall) rot_vel = abs(env.wind_delta*2)
		rot += rot_vel
		
	#endregion
	
	// Rotate, Draw, Unrotate
	image_angle += rot
	draw_self()
	image_angle -= rot
	
}

*/