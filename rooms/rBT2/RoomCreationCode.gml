try {
	
	if(M.scene_bt2 == noone)
		M.scene_bt2 = instance_create_layer(0,0,"bgc0",oBT2)
	else s = M.scene_bt2
	
} catch(_ex) {
	
	M.scene_bt2 = instance_create_layer(0,0,"bgc0",oBT2)
	
}