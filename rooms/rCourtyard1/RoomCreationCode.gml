try {
	
	if(M.scene_oCourtyard1 == noone)
		M.scene_oCourtyard1 = instance_create_layer(0,0,"bgc0",oCourtyard1)
	else s = M.scene_oCourtyard1
	
} catch(_ex) {
	
	M.scene_oCourtyard1 = instance_create_layer(0,0,"bgc0",oCourtyard1)
	
}