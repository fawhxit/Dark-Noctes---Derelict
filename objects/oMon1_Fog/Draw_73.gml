/// @description Clean Surface

// Clean Surface
if(liteSurf != noone) {

	surface_set_target(liteSurf)
	draw_clear_alpha(0,0)  // It doesn't matter what colour you give it - it's going to be transparent.
	surface_reset_target()

}