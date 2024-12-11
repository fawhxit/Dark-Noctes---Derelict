
try {
	
	if(M.scene_oCourtyard13 == noone)
		M.scene_oCourtyard13 = instance_create_layer(0,0,"bgc0",oCourtyard13)
	else s = M.scene_oCourtyard13
	
} catch(_ex) {
	
	M.scene_oCourtyard13 = instance_create_layer(0,0,"bgc0",oCourtyard13)
	
}