try {
	
	if(M.scene_oBunker17 == noone)
		M.scene_oBunker17 = instance_create_layer(0,0,"bgc0",oBunker17)
	else s = M.scene_oBunker17
	
} catch(_ex)  {
	
	M.scene_oBunker17  = instance_create_layer(0,0,"bgc0",oBunker17)
	
}