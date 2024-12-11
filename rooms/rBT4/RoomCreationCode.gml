try {
	
	if(M.scene_bt4 == noone)
		M.scene_bt4 = instance_create_layer(0,0,"bgc0",oBT4)
	else s = M.scene_bt4
	
} catch(_ex) {
	
	M.scene_bt4 = instance_create_layer(0,0,"bgc0",oBT4)
	
}