
try {
	
	if(M.scene_oCourtyard7 == noone)
		M.scene_oCourtyard7 = instance_create_layer(0,0,"bgc0",oCourtyard7)
	else s = M.scene_oCourtyard7
	
} catch(_ex) {
	
	M.scene_oCourtyard7 = instance_create_layer(0,0,"bgc0",oCourtyard7)
	
}