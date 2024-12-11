try {
	
	if(M.scene_oLab10 == noone)
		M.scene_oLab10 = instance_create_layer(0,0,"bgc0",oLab10)
	else s = M.scene_oLab10
	
} catch(_ex) {
	
	M.scene_oLab10 = instance_create_layer(0,0,"bgc0",oLab10)
	
}