try {
	
	if(M.scene_oPowerPlant4 == noone)
		M.scene_oPowerPlant4 = instance_create_layer(0,0,"bgc0",oPowerPlant4)
	else s = M.scene_oPowerPlant4
	
} catch(_ex) {
	
	M.scene_oPowerPlant4 = instance_create_layer(0,0,"bgc0",oPowerPlant4)
	
}