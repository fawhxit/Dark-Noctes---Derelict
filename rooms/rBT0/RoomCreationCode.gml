try {
	
	if(M.scene_bt0 == noone)
		M.scene_bt0 = instance_create_layer(0,0,"bgc0",oBT0)
	else s = M.scene_bt0
	
} catch(_ex) {
	
	M.scene_bt0 = instance_create_layer(0,0,"bgc0",oBT0)
	
}