try {
	
	if(M.scene_oBunker16 == noone)
		M.scene_oBunker16 = instance_create_layer(0,0,"bgc0",oBunker16)
	else s = M.scene_oBunker16
	
} catch(_ex)  {
	
	M.scene_oBunker16  = instance_create_layer(0,0,"bgc0",oBunker16)
	
}