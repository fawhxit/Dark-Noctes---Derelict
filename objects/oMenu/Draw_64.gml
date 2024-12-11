/// @description Draw Buttons
#region Menu
	
	if(room == rMenu) {
		
		// Play
		var xy1 = []
		xy1[0] = (ww*(.4))
		xy1[1] = (wh*.7)
		xy1[2] = (ww*(.6))
		xy1[3] = (wh*.8)
		var bgc1 = [2/3,c_dkgray,c_dkgray,c_black,c_black]
		var fgc1 = [1,c_ltgray,c_ltgray,c_white,c_white]
		var str1 = "Start"
		if(M.state == game.pause) str1 = "Resume"
		draw_button_fxl(xy1,bgc1,fgc1,str1,btn.play,t)
		
		// Exit
		var xy2 = []
		xy2[0] = (ww*(.4))
		xy2[1] = (wh*.85)
		xy2[2] = (ww*(.6))
		xy2[3] = (wh*.95)
		var bgc2 = [2/3,c_dkgray,c_dkgray,c_black,c_black]
		var fgc2 = [1,c_red,c_red,c_red,c_red]
		draw_button_fxl(xy2,bgc2,fgc2,"Quit",btn.exit_game,t)
		
		// Title
		var xy3 = []
		xy3[0] = ww2
		xy3[1] = wh8*1.2
		var fgc3 = c_white
		if(aT >= aTmx and aTi > 0) aTi=-aTi
		else if(aT <= aTmn and aTi < 0) aTi=-aTi
		aT+=aTi
		draw_set_font(fTitle)
		draw_set_hvalign([fa_center,fa_middle])
		draw_text_color(xy3[0],xy3[1],"Dark Noctes: Derelict",c_white,c_white,c_ltgray,c_ltgrey,aT)
		
	}
	
#endregion

#region Settings
	
	if(room == rMenu) {
		
		// Init
		var txy = [100,100,150,400]
		var tbg = [2/3,c_dkgray,c_dkgray,c_black,c_black]
		var tfg = [1.0,c_ltgray,c_ltgray,c_white,c_white]
		var txd = (txy[2]-txy[0])
		var tyd = (txy[3]-txy[1])
		var tpct = 0
		
		#region Volume Slider
			
			// Draw
			// BG
			var tao = draw_get_alpha()
			var thvo = [draw_get_halign(),draw_get_valign()]
			var tfo = draw_get_font()
			draw_set_font(fMain)
			draw_set_alpha(tbg[0])
			draw_rectangle_color(txy[0],txy[1],txy[2],txy[3],
				tbg[1],tbg[2],tbg[3],tbg[4],f)
			
			// FG
			draw_set_alpha(tfg[0])
			draw_rectangle_color(txy[0],txy[1],txy[2],txy[3],
				tfg[1],tfg[2],tfg[3],tfg[4],t)
			
			#region Mouse Interaction
				
				if(mouse_in_rectangle(txy)) {
					
					// Get PCT
					tpct = point_distance(wmx,wmy,wmx,txy[3])/tyd
					
					// Draw Hilight
					if(mbl) draw_set_alpha(tfg[0]*.1)
					else draw_set_alpha(tfg[0]*(1/3))
					draw_rectangle_color(txy[0],txy[1],txy[2],txy[3],
						tfg[1],tfg[2],tfg[3],tfg[4],f)
					
					// Set Value
					draw_set_alpha(tfg[0]/3)
					draw_rectangle_color(txy[0],txy[3]-(tyd*tpct),txy[2],txy[3],
						tfg[1],tfg[2],tfg[3],tfg[4],f)
					
					// Volume Set
					if(mbl) M.vol = tpct
					
					// Pointed Value
					draw_set_alpha(tfg[0]/2)
					draw_set_hvalign([fa_left,fa_middle])
					draw_text(txy[2],txy[3]-(tyd*tpct)," - "+string(tpct*100)+"%")
					
				}
				
			#endregion
			
			// Setting Draw
			draw_set_alpha(tfg[0])
			draw_rectangle_color(txy[0],txy[3]-(tyd*M.vol),txy[2],txy[3],
				tfg[1],tfg[2],tfg[3],tfg[4],f)
			
			// Labels
			draw_set_hvalign([fa_center,fa_bottom])
			draw_text(txy[0]+(txd/2),txy[1]-strH,"Volume")
			draw_set_hvalign([fa_left,fa_middle])
			draw_text(txy[2],txy[1]," - 100%")
			draw_text(txy[2],txy[3]," - 0%")
			
			
			// Reset
			draw_set_alpha(tao)
			draw_set_hvalign(thvo)
			draw_set_font(tfo)
			
		#endregion
		
	}
	
#endregion