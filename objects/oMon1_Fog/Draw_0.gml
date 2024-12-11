/// @description Insert description here
// You can write your code in this editor

// Init Bounds to Check
bounds = [x-(sprite_xoffset*image_xscale),y-(sprite_yoffset*image_yscale),
	x+(sprite_xoffset*image_xscale),y+(sprite_yoffset*image_yscale)]
	
if(point_in_rectangle(wmx,wmy,bounds[0],bounds[1],
	bounds[2],bounds[3]) <= p.flash.rad
	and p.flash.on) {
	
	draw_self()
	// Init Dark Surface
	if(!surface_exists(liteSurf))
		liteSurf = surface_create(ww,wh)
	surface_set_target(liteSurf)
		
	// Draw Stuff.... (i.e.)
	image_alpha*=.5
	draw_self()
	image_alpha*=2
	gpu_set_colorwriteenable(t,t,t,f)
	draw_sprite_ext(sprFlash,0,wmx,wmy,p.flash.scl,p.flash.scl,0,c_dkgray,p.flash.a)
	gpu_set_colorwriteenable(t,t,t,t)
		
	// Reset Surface and Draw
	surface_reset_target()
	draw_set_alpha(1)
	draw_surface(liteSurf,0,0)
	
} else draw_self()