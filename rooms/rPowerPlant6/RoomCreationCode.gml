try {
	
	if(M.scene_oPowerPlant6 == noone)
		M.scene_oPowerPlant6 = instance_create_layer(0,0,"bgc0",oPowerPlant6)
	else s = M.scene_oPowerPlant6
	
} catch(_ex) {
	
	M.scene_oPowerPlant6 = instance_create_layer(0,0,"bgc0",oPowerPlant6)
	
}