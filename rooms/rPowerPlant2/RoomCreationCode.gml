try {
	
	if(M.scene_oPowerPlant2 == noone)
		M.scene_oPowerPlant2 = instance_create_layer(0,0,"bgc0",oPowerPlant2)
	else s = M.scene_oPowerPlant2
	
} catch(_ex) {
	
	M.scene_oPowerPlant2 = instance_create_layer(0,0,"bgc0",oPowerPlant2)
	
}