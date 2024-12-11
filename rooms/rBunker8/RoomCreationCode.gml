try {
	
	if(M.scene_oBunker8 == noone)
		M.scene_oBunker8 = instance_create_layer(0,0,"bgc0",oBunker8)
	else s = M.scene_oBunker8
	
} catch(_ex)  {
	
	M.scene_oBunker8  = instance_create_layer(0,0,"bgc0",oBunker8)
	
}