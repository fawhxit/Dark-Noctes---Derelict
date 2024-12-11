
try {
	
	if(M.scene_oCourtyard12 == noone)
		M.scene_oCourtyard12 = instance_create_layer(0,0,"bgc0",oCourtyard12)
	else s = M.scene_oCourtyard12
	
} catch(_ex) {
	
	M.scene_oCourtyard12 = instance_create_layer(0,0,"bgc0",oCourtyard12)
	
}