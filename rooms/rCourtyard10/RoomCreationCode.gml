
try {
	
	if(M.scene_oCourtyard10 == noone)
		M.scene_oCourtyard10 = instance_create_layer(0,0,"bgc0",oCourtyard10)
	else s = M.scene_oCourtyard10
	
} catch(_ex) {
	
	M.scene_oCourtyard10 = instance_create_layer(0,0,"bgc0",oCourtyard10)
	
}