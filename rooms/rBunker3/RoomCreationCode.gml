try {
	
	if(M.scene_oBunker3 == noone)
		M.scene_oBunker3 = instance_create_layer(0,0,"bgc0",oBunker3)
	else s = M.scene_oBunker3
	
} catch(_ex)  {
	
	M.scene_oBunker3  = instance_create_layer(0,0,"bgc0",oBunker3)
	
}