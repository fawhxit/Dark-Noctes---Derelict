
try {
	
	if(M.scene_oCourtyard3 == noone)
		M.scene_oCourtyard3 = instance_create_layer(0,0,"bgc0",oCourtyard3)
	else s = M.scene_oCourtyard3
	
} catch(_ex) {
	
	M.scene_oCourtyard3 = instance_create_layer(0,0,"bgc0",oCourtyard3)
	
}