try {
	
	if(M.scene_oPowerPlant11 == noone)
		M.scene_oPowerPlant11 = instance_create_layer(0,0,"bgc0",oPowerPlant11)
	else s = M.scene_oPowerPlant11
	
} catch(_ex) {
	
	M.scene_oPowerPlant11 = instance_create_layer(0,0,"bgc0",oPowerPlant11)
	
}