
try {
	
	if(M.scene_oCourtyard5 == noone)
		M.scene_oCourtyard5 = instance_create_layer(0,0,"bgc0",oCourtyard5)
	else s = M.scene_oCourtyard5
	
} catch(_ex) {
	
	M.scene_oCourtyard5 = instance_create_layer(0,0,"bgc0",oCourtyard5)
	
}