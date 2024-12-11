/// @description Clean Surface

#region Clean Surface
	
	if(surface_exists(liteSurf)) {
		
		surface_set_target(liteSurf)
		draw_clear_alpha(0,0)  // It doesn't matter what colour you give it - it's going to be transparent.
		surface_reset_target()
		
	}
	
#endregion