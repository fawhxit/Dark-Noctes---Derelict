try {
	
	if(M.scene_oBunker15 == noone)
		M.scene_oBunker15 = instance_create_layer(0,0,"bgc0",oBunker15)
	else s = M.scene_oBunker15
	
} catch(_ex)  {
	
	M.scene_oBunker15  = instance_create_layer(0,0,"bgc0",oBunker15)
	
}