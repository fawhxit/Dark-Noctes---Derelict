try {
	
	if(M.scene_oLab4 == noone)
		M.scene_oLab4 = instance_create_layer(0,0,"bgc0",oLab4)
	else s = M.scene_oLab4
	
} catch(_ex) {
	
	M.scene_oLab4 = instance_create_layer(0,0,"bgc0",oLab4)
	
}