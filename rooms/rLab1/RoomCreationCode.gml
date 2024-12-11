try {
	
	if(M.scene_oLab1 == noone)
		M.scene_oLab1 = instance_create_layer(0,0,"bgc0",oLab1)
	else s = M.scene_oLab1
	
} catch(_ex) {
	
	M.scene_oLab1 = instance_create_layer(0,0,"bgc0",oLab1)
	
}