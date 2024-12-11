try {
	
	if(M.scene_oBunker14 == noone)
		M.scene_oBunker14 = instance_create_layer(0,0,"bgc0",oBunker14)
	else s = M.scene_oBunker14
	
} catch(_ex)  {
	
	M.scene_oBunker14  = instance_create_layer(0,0,"bgc0",oBunker14)
	
}