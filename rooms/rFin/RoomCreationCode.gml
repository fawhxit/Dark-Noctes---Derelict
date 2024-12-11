
try {
	
	if(M.fin == noone) M.fin = instance_create_layer(0,0,"fgc1",oFin)
	else s = M.fin
	
} catch(_ex) {
	
	M.fin = instance_create_layer(0,0,"fgc1",oFin)
	
}