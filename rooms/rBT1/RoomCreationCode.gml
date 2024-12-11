try {
	
	if(M.scene_bt1 == noone)
		M.scene_bt1 = instance_create_layer(0,0,"bgc0",oBT1)
	else s = M.scene_bt1
	
} catch(_ex) {
	
	M.scene_bt1 = instance_create_layer(0,0,"bgc0",oBT1)
	
}