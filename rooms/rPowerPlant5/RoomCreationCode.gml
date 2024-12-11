try {
	
	if(M.scene_oPowerPlant5 == noone)
		M.scene_oPowerPlant5 = instance_create_layer(0,0,"bgc0",oPowerPlant5)
	else s = M.scene_oPowerPlant5
	
} catch(_ex) {
	
	M.scene_oPowerPlant5 = instance_create_layer(0,0,"bgc0",oPowerPlant5)
	
}