/// @description Init Drop

#region Setup Image/Type
	
	// Init
	image_speed = 0
	r = 0
	g = 0
	b = 0
	high_drag = f
	
	// FX
	fx = noone
	do_fx = f
	fade_spd = .01
	
	// Setup Type
	if(chance(90)) {
	
		// Rain
		image_index = irandom(2)
		r = 19+(irandom_range(-3,3))
		g = 166+(irandom_range(-10,10))
		b = 209+(irandom_range(-10,10))
		image_blend = make_color_rgb(r,g,b)
		image_alpha = random_range(0.5,0.9)
		fx = vfx.splash
	
	} else if(chance(67) or (env.wind_delta < 1.75 and env.wind_delta > -1.75)) {
	
		// Snow
		image_index = 3
		r = irandom_range(245,255)
		g = irandom_range(245,255)
		b = irandom_range(245,255)
		image_blend = make_color_rgb(r,g,b)
		image_alpha = 1
		high_drag = t
		fx = vfx.fade
	
	} else {
	
		// Leaf
		if(env.wind_delta > 1.75) {
			
			y = irandom_range(-100,M.hRef*.6)
			x = -100*M.vRef
			image_angle = random_range(280,330)
			
		} else {
			
			y = irandom_range(-100,M.hRef*.6)
			x = M.wRef+(100*M.vRef)
			image_angle = random_range(210,260)
			
		}
		image_index = 4
		r = irandom_range(160,240)
		g = irandom_range(90,180)
		b = 0
		image_blend = make_color_rgb(r,g,b)
		image_alpha = 1
		high_drag = t
		fx = vfx.bounce
	
	}
	
#endregion

#region Control Vars
	
	// Relatives
	rel_factor = gen_rel(noone)
	rel_invert = 1
	if(flip()) rel_invert = -rel_invert
	rel_bottom = get_rel_bot(rel_factor)
	rel_depth_dlt = round(30*-rel_factor)
	depth += rel_depth_dlt

	// Size/Direction
	image_xscale = rel_factor
	image_yscale = image_xscale
	if(flip()) image_yscale = -image_yscale
	image_angle = env.drop_dir

	// Rotation (Superficial)
	rot = 0

	// Acceleration/Velocity
	xx = x
	yy = y
	if(!high_drag) acc = (env.base_vel/(Gspd/2))
	else acc = (env.base_vel/(Gspd))
	vel = env.base_vel
	vel_mn = vel*0.8
	vel_mx = vel*1.5
	if(high_drag) {
		
		vel_mn = vel_mn/2
		vel = vel*.5
		vel_mx = vel_mx*2
		
	}
	bounced = f
	bounce_vel = 0
	
#endregion
