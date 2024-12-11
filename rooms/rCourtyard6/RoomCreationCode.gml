
try {
	
	if(M.scene_oCourtyard6 == noone)
		M.scene_oCourtyard6 = instance_create_layer(0,0,"bgc0",oCourtyard6)
	else s = M.scene_oCourtyard6
	
} catch(_ex) {
	
	M.scene_oCourtyard6 = instance_create_layer(0,0,"bgc0",oCourtyard6)
	
}