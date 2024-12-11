try {
	
	if(M.scene_oPowerPlant1 == noone)
		M.scene_oPowerPlant1 = instance_create_layer(0,0,"bgc0",oPowerPlant1)
	else s = M.scene_oPowerPlant1
	
} catch(_ex) {
	
	M.scene_oPowerPlant1 = instance_create_layer(0,0,"bgc0",oPowerPlant1)
	
}