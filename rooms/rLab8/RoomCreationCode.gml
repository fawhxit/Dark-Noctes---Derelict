try {
	
	if(M.scene_oLab8 == noone)
		M.scene_oLab8 = instance_create_layer(0,0,"bgc0",oLab8)
	else s = M.scene_oLab8
	
} catch(_ex) {
	
	M.scene_oLab8 = instance_create_layer(0,0,"bgc0",oLab8)
	
}