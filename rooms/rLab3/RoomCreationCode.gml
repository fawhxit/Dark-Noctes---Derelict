try {
	
	if(M.scene_oLab3 == noone)
		M.scene_oLab3 = instance_create_layer(0,0,"bgc0",oLab3)
	else s = M.scene_oLab3
	
} catch(_ex) {
	
	M.scene_oLab3 = instance_create_layer(0,0,"bgc0",oLab3)
	
}