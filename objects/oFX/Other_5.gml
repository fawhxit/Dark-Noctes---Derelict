/// @description Leaving Room...

if(room == in_room) {
	
	// Undo Environmental Lighting Changes
	if(envLight != noone or envLighta != noone) {
		
		env.lights_override = f
		env.lights_a = 0.95
		env.lights_current = env.lights_off
		
	}
	
	// Undo Environmental Blend Changes
	if(envBlend != noone) {
		
		env.blend_override = f
		env.blend_current = env.blend_off
		
	}
	
}
