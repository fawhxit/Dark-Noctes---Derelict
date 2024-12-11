try {
	
	if(M.scene_oLab9 == noone)
		M.scene_oLab9 = instance_create_layer(0,0,"bgc0",oLab9)
	else s = M.scene_oLab9
	
} catch(_ex) {
	
	M.scene_oLab9 = instance_create_layer(0,0,"bgc0",oLab9)
	
}