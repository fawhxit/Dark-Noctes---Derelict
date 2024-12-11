try {
	
	if(M.scene_oBunker6 == noone)
		M.scene_oBunker6 = instance_create_layer(0,0,"bgc0",oBunker6)
	else s = M.scene_oBunker6
	
} catch(_ex)  {
	
	M.scene_oBunker6  = instance_create_layer(0,0,"bgc0",oBunker6)
	
}