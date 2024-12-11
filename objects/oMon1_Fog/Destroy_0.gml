/// @description Clear Surface

// Destroy Surface
if(liteSurf != noone) {
	
	surface_free(liteSurf)
	liteSurf = noone
	
}