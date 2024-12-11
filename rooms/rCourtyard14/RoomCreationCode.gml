
try {
	
	if(M.scene_oCourtyard14 == noone)
		M.scene_oCourtyard14 = instance_create_layer(0,0,"bgc0",oCourtyard14)
	else s = M.scene_oCourtyard14
	
} catch(_ex) {
	
	M.scene_oCourtyard14 = instance_create_layer(0,0,"bgc0",oCourtyard14)
	
}