try {
	
	if(M.scene_oPowerPlant8 == noone)
		M.scene_oPowerPlant8 = instance_create_layer(0,0,"bgc0",oPowerPlant8)
	else s = M.scene_oPowerPlant8
	
} catch(_ex) {
	
	M.scene_oPowerPlant8 = instance_create_layer(0,0,"bgc0",oPowerPlant8)
	
}