try {
	
	if(M.scene_oBunker13 == noone)
		M.scene_oBunker13 = instance_create_layer(0,0,"bgc0",oBunker13)
	else s = M.scene_oBunker13
	
} catch(_ex)  {
	
	M.scene_oBunker13  = instance_create_layer(0,0,"bgc0",oBunker13)
	
}