/// @description Draw Prompt

if(active) {
	
	// BG Draw
	draw_set_alpha(bgc[0])
	draw_rectangle_color(xy[0]-mar,xy[1]-mar,xy[2]+mar,xy[3]+mar,
		bgc[1],bgc[2],bgc[3],bgc[4],f)
	
	var w = xy[2]-xy[0]
	var h = xy[3]-xy[1]
	var strw = string_width(str)
	var strh = string_height_ext(str,strH,strw)
	var strx = xy[0]
	var stry = xy[1]
	var dltW = w-strw
	var dltW2 = dltW/2
	var dltH = h-strh
	var dltH2 = dltH/2
	
	// Init Text Draw
	draw_set_font(fMain)
	draw_set_hvalign([fa_left,fa_top])
	if(strw < w)
		strx += dltW2
	if(strh < h)
		stry += dltH/2
		
	
	// Text Draw
	draw_text_ext_color(strx,stry,str_out,strH,w,
		fgc[1],fgc[2],fgc[3],fgc[4],fgc[0])
	
}