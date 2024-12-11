try {
	
	if(M.scene_oBunker4 == noone)
		M.scene_oBunker4 = instance_create_layer(0,0,"bgc0",oBunker4)
	else s = M.scene_oBunker4
	
} catch(_ex)  {
	
	M.scene_oBunker4  = instance_create_layer(0,0,"bgc0",oBunker4)
	
}