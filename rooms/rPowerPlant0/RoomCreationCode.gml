try {
	
	if(M.scene_oPowerPlant0 == noone)
		M.scene_oPowerPlant0 = instance_create_layer(0,0,"bgc0",oPowerPlant0)
	else s = M.scene_oPowerPlant0
	
} catch(_ex) {
	
	M.scene_oPowerPlant0 = instance_create_layer(0,0,"bgc0",oPowerPlant0)
	
}