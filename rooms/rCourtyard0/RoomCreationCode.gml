try {
	
	if(M.scene_oCourtyard0 == noone)
		M.scene_oCourtyard0 = instance_create_layer(0,0,"bgc0",oCourtyard0)
	else s = M.scene_oCourtyard0
	
} catch(_ex) {
	
	M.scene_oCourtyard0 = instance_create_layer(0,0,"bgc0",oCourtyard0)
	
}