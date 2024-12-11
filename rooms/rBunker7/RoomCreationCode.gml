try {
	
	if(M.scene_oBunker7 == noone)
		M.scene_oBunker7 = instance_create_layer(0,0,"bgc0",oBunker7)
	else s = M.scene_oBunker7
	
} catch(_ex)  {
	
	M.scene_oBunker7  = instance_create_layer(0,0,"bgc0",oBunker7)
	
}