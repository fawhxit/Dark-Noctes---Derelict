/// @description Draw Node (GUI)

if(in_room == room and active) {
	
	gpu_set_blendmode(bm_normal)
	
	// Text
	draw_set_font(fScene)
	draw_set_hvalign([fa_center,fa_middle])
	draw_text_ext_color(x,y,str[stri],strH,ww*.45,
		fgc[1],fgc[2],fgc[3],fgc[4],fgc[0])
	draw_set_font(fMain)
	
}