try {
	
	if(M.scene_oLab0 == noone)
		M.scene_oLab0 = instance_create_layer(0,0,"bgc0",oLab0)
	else s = M.scene_oLab0
	
} catch(_ex) {
	
	M.scene_oLab0 = instance_create_layer(0,0,"bgc0",oLab0)
	
}