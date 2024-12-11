try {
	
	if(M.scene_oLab2 == noone)
		M.scene_oLab2 = instance_create_layer(0,0,"bgc0",oLab2)
	else s = M.scene_oLab2
	
} catch(_ex) {
	
	M.scene_oLab2 = instance_create_layer(0,0,"bgc0",oLab2)
	
}