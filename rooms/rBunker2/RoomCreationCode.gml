try {
	
	if(M.scene_oBunker2 == noone)
		M.scene_oBunker2 = instance_create_layer(0,0,"bgc0",oBunker2)
	else s = M.scene_oBunker2
	
} catch(_ex)  {
	
	M.scene_oBunker2  = instance_create_layer(0,0,"bgc0",oBunker2)
	
}