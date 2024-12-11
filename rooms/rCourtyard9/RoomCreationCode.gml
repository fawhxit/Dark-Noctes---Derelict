
try {
	
	if(M.scene_oCourtyard9 == noone)
		M.scene_oCourtyard9 = instance_create_layer(0,0,"bgc0",oCourtyard9)
	else s = M.scene_oCourtyard9
	
} catch(_ex) {
	
	M.scene_oCourtyard9 = instance_create_layer(0,0,"bgc0",oCourtyard9)
	
}