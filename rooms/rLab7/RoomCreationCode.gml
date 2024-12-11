try {
	
	if(M.scene_oLab7 == noone)
		M.scene_oLab7 = instance_create_layer(0,0,"bgc0",oLab7)
	else s = M.scene_oLab7
	
} catch(_ex) {
	
	M.scene_oLab7 = instance_create_layer(0,0,"bgc0",oLab7)
	
}