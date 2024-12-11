try {
	
	if(M.scene_oCourtyard2 == noone)
		M.scene_oCourtyard2 = instance_create_layer(0,0,"bgc0",oCourtyard2)
	else s = M.scene_oCourtyard2
	
} catch(_ex) {
	
	M.scene_oCourtyard2 = instance_create_layer(0,0,"bgc0",oCourtyard2)
	
}