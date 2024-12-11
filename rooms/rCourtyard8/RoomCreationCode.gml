
try {
	
	if(M.scene_oCourtyard8 == noone)
		M.scene_oCourtyard8 = instance_create_layer(0,0,"bgc0",oCourtyard8)
	else s = M.scene_oCourtyard8
	
} catch(_ex) {
	
	M.scene_oCourtyard8 = instance_create_layer(0,0,"bgc0",oCourtyard8)
	
}