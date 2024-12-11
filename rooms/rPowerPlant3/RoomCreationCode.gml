try {
	
	if(M.scene_oPowerPlant3 == noone)
		M.scene_oPowerPlant3 = instance_create_layer(0,0,"bgc0",oPowerPlant3)
	else s = M.scene_oPowerPlant3
	
} catch(_ex) {
	
	M.scene_oPowerPlant3 = instance_create_layer(0,0,"bgc0",oPowerPlant3)
	
}