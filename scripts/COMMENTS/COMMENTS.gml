function COMMENTS(){
	
	/*
		
		********************************************
		* Below are temporary development comments *
		********************************************
	
			You can do it.
		
			Anyways,
			
			Got Mon1 working well,
			the eyes actually freak me out.
			
			I need to give it sfx and a spawn/despawn
			procedure, behavior, attack/death screen,
			and clues to its approach/presence, aswell
			as determine how to evade/hide from it.
			
			It should spawn coming from either the
			left or right, based on wind direction
			that will be tracked in the background
			the whole game.
			
			I've already set up a dynamic depth for it.
			I wonder how I might affect its sfx based on
			depth, Reverb? More reverb the farther away?
			How should its depth/distance from player
			affect its behavior... Less aware/dangerous
			farther away? Might it approach off screen?
			In the middle of the screen? ...
			
			That gives me a great idea! What if I shoot
			up it's scale and depth as the sort of
			"kill player" behavior? Like a jumpscare
			you that you'd see lunging at you.
			
			... break ...
			
			Just like all monsters when/if they spawn
			on either edge of the lane, they will
			somehow move through the land or perhaps
			"tease" by being moved back out via where
			they spawned without ever actually crossing
			the player.
			
			... break ...
			
			End
			
		********************************************
		* Above are temporary development comments *
		********************************************
		
		
		
		********************************************
		* Below are scratch codes for copy/pasting *
		********************************************
		
		*******************************
		* Surface Template (darkSurf) *
		*******************************
		
		*** DRAW EVENT ***
		
		// Init Dark Surface
		if(darkSurf == noone)
			darkSurf = surface_create(ww,wh)
		surface_set_target(darkSurf)
		
		// Draw Stuff.... (i.e.)
		gpu_set_blendmode(bm_subtract)
			
		if(!env.shelter) draw_sprite_ext(sprLightFlash,0,env.light_x,env.light_y,
			p.flash.scl,p.flash.scl,irandom(359),env.light_c,env.light_a)
		draw_set_alpha(env.light_a)
		draw_rectangle_color(0,0,ww,wh,env.light_c,env.light_c,env.light_c,env.light_c,f)
			
		gpu_set_blendmode(bm_normal)l
		
		// Reset Surface and Draw
		surface_reset_target()
		draw_set_alpha(1)
		draw_surface(darkSurf,0,0)
		
		*****************************************************
		* Surface Template w/ Overlapping Sprite (liteSurf) *
		*****************************************************
		
		*** DRAW EVENT ***
		
		// Init Bounds to Check
		bounds = [x-(sprite_xoffset*image_xscale),y-(sprite_yoffset*image_yscale),
			x+(sprite_xoffset*image_xscale),y+(sprite_yoffset*image_yscale)]
	
		if(point_in_rectangle(wmx,wmy,bounds[0],bounds[1],
			bounds[2],bounds[3]) <= p.flash.rad
			and p.flash.on) {
	
			draw_self()
			// Init Dark Surface
			if(liteSurf == noone)
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
		
		*** DRAW END EVENT ***
		
		if(liteSurf != noone) {

			surface_set_target(liteSurf)
			draw_clear_alpha(0,0)  // It doesn't matter what colour you give it - it's going to be transparent.
			surface_reset_target()

		}
		
		
		**************************************
		* Scene Instance X/Y Update Template *
		**************************************
		
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
		
	*/
	
}