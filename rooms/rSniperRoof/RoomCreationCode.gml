try {
	
	if(M.scene_sniperRoof == noone)
		M.scene_sniperRoof = instance_create_layer(0,0,"bgc0",oSniperRoof)
	else s = M.scene_sniperRoof
	
} catch(_ex) {
	
	M.scene_sniperRoof = instance_create_layer(0,0,"bgc0",oSniperRoof)
	
}