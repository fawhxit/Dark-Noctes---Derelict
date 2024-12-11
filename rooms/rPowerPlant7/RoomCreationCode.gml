try {
	
	if(M.scene_oPowerPlant7 == noone)
		M.scene_oPowerPlant7 = instance_create_layer(0,0,"bgc0",oPowerPlant7)
	else s = M.scene_oPowerPlant7
	
} catch(_ex) {
	
	M.scene_oPowerPlant7 = instance_create_layer(0,0,"bgc0",oPowerPlant7)
	
}