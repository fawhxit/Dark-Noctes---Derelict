try {
	
	if(M.scene_oBunker1 == noone)
		M.scene_oBunker1 = instance_create_layer(0,0,"bgc0",oBunker1)
	else s = M.scene_oBunker1
	
} catch(_ex)  {
	
	M.scene_oBunker1  = instance_create_layer(0,0,"bgc0",oBunker1)
	
}