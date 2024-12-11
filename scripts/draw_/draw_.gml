// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_button_fxl(xy,bgc,fgc,str,act,enabled){
	
	// If not enabled, halve alpha
	if(!enabled) {
		
		bgc[0] = bgc[0]/2
		fgc[0] = fgc[0]/2
		
	}
	
	#region Body
		
		// BG
		draw_set_alpha(bgc[0])
		draw_rectangle_color(xy[0],xy[1],xy[2],xy[3],
			bgc[1],bgc[2],bgc[3],bgc[4],f)
		
		// Outline
		draw_set_alpha(fgc[0])
		draw_rectangle_color(xy[0],xy[1],xy[2],xy[3],
			fgc[1],fgc[2],fgc[3],fgc[4],t)
		
	#endregion
	
	#region Interaction
	
		if(wmx > xy[0] and wmx < xy[2] and wmy > xy[1]
			and wmy < xy[3] and enabled) {
		
			// Hilight
			if(mbl) draw_set_alpha(fgc[0]*.25)
			else draw_set_alpha(fgc[0]*.5)
			draw_rectangle_color(xy[0],xy[1],xy[2],xy[3],
				fgc[1],fgc[2],fgc[3],fgc[4],f)
			
			// Do button action
			if(mblr) button_action(act)
			
		}
	
	#endregion
	
	#region Text
		
		var midx = lerp(xy[0],xy[2],0.5)
		var midy = lerp(xy[1],xy[3],0.5)
		draw_set_font(fMain)
		draw_set_hvalign([fa_center,fa_middle])
		draw_text_color(midx,midy,str,fgc[1],fgc[2],
			fgc[3],fgc[4],fgc[0])
		
	#endregion
	
}

function button_action(act) {
	
	switch(act) {
		
		case btn.play: {
			
			if(M.state == game.pause) {
				
				M.state = game.play
				room_goto(M.roomOld)
				
			} else if(M.state == game.init) {
				
				M.state = game.intro
				room_goto(rBT0)
				
			}
			
			break
			
		}
		
		case btn.exit_game: {
			
			game_end()
			
		}
		
		default: break
		
	}
	
}
	
function draw_set_hvalign(hva) {
	
	draw_set_halign(hva[0])
	draw_set_valign(hva[1])
	
}
	
function scl_spr2win(spr,pct) {
	
	// Init
	var sprw = sprite_get_width(spr)
	var sprh = sprite_get_height(spr)
	
	// Calculate & Return
	if(sprw > sprh) return (ww/sprw)*pct
	else return (wh/sprh)*pct
	
}

function scl_spr2spr(spr,spr2,scl2,pct) {
	
	// Init
	var sprw = sprite_get_width(spr)
	var sprh = sprite_get_height(spr)
	
	// Calculate & Return
	if(is2(scl2)) {
		
		// Scaled spr2
		if(sprw > sprh) return ((sprite_get_width(spr2)*scl2)/sprw)*pct
		else return ((sprite_get_height(spr2)*scl2)/sprh)*pct
		
	} else {
		
		// Unscaled spr2
		if(sprw > sprh) return (sprite_get_width(spr2)/sprw)*pct
		else return (sprite_get_height(spr2)/sprh)*pct
		
	}
	
}

function scl_spr2wh(spr,_wh,pct) {
	
	// Init
	var sprw = sprite_get_width(spr)
	var sprh = sprite_get_height(spr)
	
	// Calculate & Return
	if(sprw > sprh) return (_wh[0]/sprw)*pct
	else return (_wh[1]/sprh)*pct
	
}

function draw_rectangle_ext_color(xy4,rot,c5,outline) {
	
    #region Init & Calculations
		
		// Orign x/y
		var ox,oy
		ox = lerp(xy4[0],xy4[2],0.5)
		oy = lerp(xy4[1],xy4[3],0.5)
		
		// Get x/y rotations
		var sxx,sxy,syx,syy
		sxx =  cos(degtorad(rot))
		sxy = -sin(degtorad(rot))
		syx =  sin(degtorad(rot))
		syy =  cos(degtorad(rot))
		
		// Apply x rotations
		var sx1,sx2,sx3,sx4
		sx1 = sxx*(xy4[0]-ox)
		sx2 = sxx*(xy4[2]-ox)
		sx3 = sxy*(xy4[0]-ox)
		sx4 = sxy*(xy4[2]-ox)
		
		// Apply y rotations
		var sy1,sy2,sy3,sy4
		sy1 = syx*(xy4[1]-oy)
		sy2 = syx*(xy4[3]-oy)
		sy3 = syy*(xy4[1]-oy)
		sy4 = syy*(xy4[3]-oy)
		
		// Get rectangle x coordinates
		var xx1,xx2,xx3,xx4
		xx1=ox+sx1+sy1
		xx2=ox+sx2+sy1
		xx3=ox+sx2+sy2
		xx4=ox+sx1+sy2
		
		// Get rectangle y coordinates
		var yy1,yy2,yy3,yy4
		yy1=oy+sx3+sy3
		yy2=oy+sx4+sy3
		yy3=oy+sx4+sy4
		yy4=oy+sx3+sy4
		
    #endregion Init & Calculations
	
    #region Draw
		
		// Set Alpha
		var ao = draw_get_alpha()
		draw_set_alpha(c5[0])
		
		// Draw...
		if(outline) {
		    
		    // Outline
		    draw_line_color(xx1,yy1,xx4,yy4,c5[1],c5[4])
		    draw_line_color(xx2,yy2,xx1,yy1,c5[2],c5[1])
		    draw_line_color(xx3,yy3,xx2,yy2,c5[3],c5[2])
		    draw_line_color(xx4,yy4,xx3,yy3,c5[4],c5[3])
		    
		} else {
		    
		    // Filled
		    draw_triangle_color(xx1,yy1,xx2,yy2,xx3,yy3,c5[1],c5[2],c5[3],false)
		    draw_triangle_color(xx1,yy1,xx3,yy3,xx4,yy4,c5[1],c5[3],c5[4],false)
		    
		}
		
		// Reset Alpha
		draw_set_alpha(ao)
		
    #endregion Draw
	
}