
try {
	
	if(M.scene_oCourtyard4 == noone)
		M.scene_oCourtyard4 = instance_create_layer(0,0,"bgc0",oCourtyard4)
	else s = M.scene_oCourtyard4
	
} catch(_ex) {
	
	M.scene_oCourtyard4 = instance_create_layer(0,0,"bgc0",oCourtyard4)
	
}