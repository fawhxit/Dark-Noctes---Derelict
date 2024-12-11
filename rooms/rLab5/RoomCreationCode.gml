try {
	
	if(M.scene_oLab5 == noone)
		M.scene_oLab5 = instance_create_layer(0,0,"bgc0",oLab5)
	else s = M.scene_oLab5
	
} catch(_ex) {
	
	M.scene_oLab5 = instance_create_layer(0,0,"bgc0",oLab5)
	
}