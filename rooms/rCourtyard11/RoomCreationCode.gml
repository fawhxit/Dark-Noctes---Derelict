
try {
	
	if(M.scene_oCourtyard11 == noone)
		M.scene_oCourtyard11 = instance_create_layer(0,0,"bgc0",oCourtyard11)
	else s = M.scene_oCourtyard11
	
} catch(_ex) {
	
	M.scene_oCourtyard11 = instance_create_layer(0,0,"bgc0",oCourtyard11)
	
}