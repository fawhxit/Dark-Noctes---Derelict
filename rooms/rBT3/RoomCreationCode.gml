try {
	
	if(M.scene_bt3 == noone)
		M.scene_bt3 = instance_create_layer(0,0,"bgc0",oBT3)
	else s = M.scene_bt3
	
} catch(_ex) {
	
	M.scene_bt3 = instance_create_layer(0,0,"bgc0",oBT3)
	
}