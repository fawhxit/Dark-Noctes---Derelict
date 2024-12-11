try {
	
	if(M.scene_oBunker11 == noone)
		M.scene_oBunker11 = instance_create_layer(0,0,"bgc0",oBunker11)
	else s = M.scene_oBunker11
	
} catch(_ex)  {
	
	M.scene_oBunker11  = instance_create_layer(0,0,"bgc0",oBunker11)
	
}