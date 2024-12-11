try {
	
	if(M.scene_oBunker10 == noone)
		M.scene_oBunker10 = instance_create_layer(0,0,"bgc0",oBunker10)
	else s = M.scene_oBunker10
	
} catch(_ex)  {
	
	M.scene_oBunker10  = instance_create_layer(0,0,"bgc0",oBunker10)
	
}