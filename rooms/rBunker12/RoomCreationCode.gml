try {
	
	if(M.scene_oBunker12 == noone)
		M.scene_oBunker12 = instance_create_layer(0,0,"bgc0",oBunker12)
	else s = M.scene_oBunker12
	
} catch(_ex)  {
	
	M.scene_oBunker12  = instance_create_layer(0,0,"bgc0",oBunker12)
	
}