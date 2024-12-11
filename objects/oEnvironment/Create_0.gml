/// @description Init Environment

#region Environment Globals
	
	// Flags
	outdoor = f
	overLtn = f
	shelter = f
	cave    = f
	station = f
	power_main		= f
	power_alert		= f
	power_reserve   = f
	market = f
	
	// Wind
	wind_delta = random_range(-1,1)
	wind_pol = 1
	if(flip()) wind_pol = -wind_pol
	
	// Frame Iterator
	frame = irandom_range(45,315)
	
	// Defaults
	base_vel = wh/Gspd
	
	// Set Audio Orientation to: Left/Up(-) && Right/Down(+)
	audio_listener_set_orientation(0,0,0,1,0,-1,0)
	
#endregion

#region Drops Globals
	
	// Drop Basics
	drop_dir = 270+(wind_delta*10)
	drop_mn  = 100
	drop_mx  = 600
	drop_num = 0
	
	// Delay
	drop_del  = irandom(4)
	drop_deli = 0
	
	// SFX
	out_rain = (outdoor and !shelter)
	audio_set_master_gain(0,1.0)
	
#endregion

#region Fog
	
	// Fog Basics
	fog_num = 0
	fog_mn  = 4
	
#endregion

#region Lightening
	
	// Init
	light_x = irandom_range(0,ww)
	light_y = irandom_range(0,wh*0.2)
	light_c = c_white
	light_a = 0
	light_a_mn = 0.1
	light_a_mx = 1.0
	
	// FX
	light_sfx_done = f
	light_sfx_g = 1.0
	
	// Flicker Delay
	light_flick_del  = irandom_range(1,4)
	light_flick_deli = 0
	
	// Delay
	light_del  = irandom_range(Gspd*5,Gspd*10)
	light_deli = 0
	
	// Length
	light_len  = irandom_range(Gspd/3,Gspd*.67)
	light_leni = noone
	
#endregion

#region Power/Lighting
	
	lights_override = f
	lights_a = 0.95
	lights_off = make_color_rgb(0,0,10)
	lights_red = make_color_rgb(255,10,10)
	lights_blue = make_color_rgb(10,10,255)
	lights_red_dim = make_color_rgb(96,0,10)
	lights_current = lights_off
	
	blend_override = f
	blend_off = make_color_rgb(128,128,128)
	blend_red = make_color_rgb(255,96,96)
	blend_blue = make_color_rgb(96,96,255)
	blend_light_red = make_color_rgb(255,192,192)
	blend_current = blend_off
	
#endregion

enum vfx {
	
	fade,
	bounce,
	splash
	
}