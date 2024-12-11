try {
	
	if(M.scene_oBunker5 == noone)
		M.scene_oBunker5 = instance_create_layer(0,0,"bgc0",oBunker5)
	else s = M.scene_oBunker5
	
} catch(_ex)  {
	
	M.scene_oBunker5  = instance_create_layer(0,0,"bgc0",oBunker5)
	
}