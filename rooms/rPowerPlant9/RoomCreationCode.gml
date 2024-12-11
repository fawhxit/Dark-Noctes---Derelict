try {
	
	if(M.scene_oPowerPlant9 == noone)
		M.scene_oPowerPlant9 = instance_create_layer(0,0,"bgc0",oPowerPlant9)
	else s = M.scene_oPowerPlant9
	
} catch(_ex) {
	
	M.scene_oPowerPlant9 = instance_create_layer(0,0,"bgc0",oPowerPlant9)
	
}