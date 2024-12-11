try {
	
	if(M.scene_oBunker9 == noone)
		M.scene_oBunker9 = instance_create_layer(0,0,"bgc0",oBunker9)
	else s = M.scene_oBunker9
	
} catch(_ex)  {
	
	M.scene_oBunker9  = instance_create_layer(0,0,"bgc0",oBunker9)
	
}