try {
	
	if(M.scene_oLab6 == noone)
		M.scene_oLab6 = instance_create_layer(0,0,"bgc0",oLab6)
	else s = M.scene_oLab6
	
} catch(_ex) {
	
	M.scene_oLab6 = instance_create_layer(0,0,"bgc0",oLab6)
	
}