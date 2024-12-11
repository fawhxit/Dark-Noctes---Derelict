/// @description Flashlight/Darkness

if(is2(subGame)) {
	
	try {
	
	switch(subGame.object_index) {
		
		case eSniperGame: {
			
			
			break
			
		}
		
		default: subGame = noone;
		
	}
	
	} catch(_ex) {
		
		show_debug_message("Subgame Crash!")
		show_debug_message(_ex)
		subGame = noone
		
	}
	
} else {
	
	main_draw_end()
	
	#region Darkness/Flashlight
		
		if(state == game.play and p.dark
			and room != rMenu) {
			
			// Return/Drop
			if((mbr or keyboard_check_pressed(ord("Q"))) and p.in_hand != noone)
				return_drop_item()
			
			#region Flashlight Search
        				
        				if(p.flash.on or p.flash.disable) {
        					
        					#region Search Logic
        						
        						if(cov.pct <= 0) {
        							
        							#region Do Searching
        								
        								if(mbrp and !p.search.on and s.scene_inst = noone) {
        									
        									p.search.on = t
        									p.search.rad = 0
        									
        								} else if(mbr and p.search.on and !p.search.done and s.scene_inst = noone) {
        									
        									p.search.duri += 1
        									p.search.rad = (p.search.duri/p.search.dur)*(p.flash.rad*0.67)
        									
        									// Draw Search Ring
        									
        									draw_set_alpha(p.search.fga)
        									draw_circle_color(wmx,wmy,p.search.rad,
        										p.search.fgc,p.search.fgc,t)
        									draw_circle_color(wmx,wmy,p.search.rad+1,
        										p.search.fgc,p.search.fgc,t)
        									draw_circle_color(wmx,wmy,p.search.rad+2,
        										p.search.fgc,p.search.fgc,t)
        									
        									if(p.search.duri >= p.search.dur)
        										p.search.done = t
        									
        								} else if(mbr and p.search.on and p.search.done and s.scene_inst = noone) {
        									
        									p.search.on = t
        									p.search.done = f
        									p.search.duri = 0
        									p.search.rad = 0
        									
        									#region Find Nodes
        							
        										var node_arr = []
        										for (var i = 0; i < instance_number(oNode); i++)
        										    node_arr[i] = instance_find(oNode,i)
        						
        										for(var i = 0; i < array_length(node_arr); i++) {
        							
        											var inst = node_arr[i]
        							
        											if(near_mouse(inst,p.flash.rad) and inst.can_find) {
        												inst.overlay = t
        												inst.found = t
        											}
        							
        										}
        						
        									#endregion
        									
        									#region Find Entities
        						
        										var enti_arr = []
        										for (var i = 0; i < instance_number(oEntity); i++)
        										    enti_arr[i] = instance_find(oEntity,i)
        						
        										for(var i = 0; i < array_length(enti_arr); i++) {
        							
        											var inst = enti_arr[i]
        							
        											if(near_mouse(inst,p.flash.rad) and inst.can_find) {
        												inst.overlay = t
        												inst.found = t
        											}
        							
        										}
        						
        									#endregion
        									
        									#region Ping Sound
        										
        										audio_play_sound_at(sndPing,0,0,0,5,32,1,f,5,1/3,0,2/3)
        										
        									#endregion
        									
        								}
        							
        							#endregion
        							
        							#region End Searching
        								
        								if(mbrr or s.scene_inst != noone) {
        									
        									p.search.on = f
        									p.search.done = f
        									p.search.duri = 0
        									p.search.rad = 0
        									
        								}
        								
        							#endregion
        						
        						}
        					
        					#endregion
        					
        				}
        				
        			#endregion
			
		}
		
		#region Free Dark Surface if not Dark
			
			if(!p.dark and surface_exists(darkSurf))
				surface_free(darkSurf)
			
		#endregion
		
	#endregion
	
	#region Hit/Attack Draw
		
		if(is2(p.in_hand)) {
			
			if(p.in_hand.state == ent.weapon) {
				
				#region Init
					
					var _spr = p.in_hand.spr
					var _mn = -45
					var _mx = 55
					// Branch is at a weird angle, adjust for it...
					if(_spr == sprBranch) {
						
						_spr = sprBranch2
						_mn = 20
						_mx = 120
						
					} else _spr = sprCrowbar2;
					var _pct = p.swingi/p.swingDel
					var _deg = lerp(_mn,_mx,_pct)
					var _scl = scl_spr2win(_spr,.8)
					
				#endregion
				
				// Draw
				draw_sprite_ext(_spr,0,(ww*.8)-(400*_pct),wh+(400*_pct),_scl,_scl,_deg,env.blend_current,1)
				
			}
			
		}
		
	#endregion
	
}