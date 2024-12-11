try {
	
	if(M.scene_oBunker0 == noone)
		M.scene_oBunker0 = instance_create_layer(0,0,"bgc0",oBunker0)
	else s = M.scene_oBunker0
	
} catch(_ex)  {
	
	M.scene_oBunker0  = instance_create_layer(0,0,"bgc0",oBunker0)
	
}