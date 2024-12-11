try {
	
	if(M.scene_oPowerPlant10 == noone)
		M.scene_oPowerPlant10 = instance_create_layer(0,0,"bgc0",oPowerPlant10)
	else s = M.scene_oPowerPlant10
	
} catch(_ex) {
	
	M.scene_oPowerPlant10 = instance_create_layer(0,0,"bgc0",oPowerPlant10)
	
}