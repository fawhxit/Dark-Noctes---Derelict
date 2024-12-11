/// @description Global Updates

if(is2(subGame)) {
	
	try {
		
		switch(subGame.object_index) {
			
			case eSniperGame.object_index: {
				
				break
				
			}
			
			default: subGame = noone; break;
			
		}
		
	} catch(_ex) {
		
		show_debug_message("Subgame Crash!")
		show_debug_message(_ex)
		subGame = noone
		
	}
	
} else {
	
	main_step_begin()
	
	#region Player
		
		#region Flash
			
			p.flash.scl = (wh/sprite_get_height(sprFlash))*.5
			if(!p.flash.on) p.flash.rad = 0
			else p.flash.rad = round((sprite_get_height(sprFlash)*p.flash.scl)/2)
			
		#endregion
		
		#region Res_Inv DISABLED
			
			/* DISABLED
			p.res_inv.wt_tot = 0
			p.res_inv.unknown.wt_tot = p.res_inv.unknown.num*p.res_inv.unknown.wt
			p.res_inv.wt_tot += p.res_inv.unknown.wt_tot
			p.res_inv.inorganic.wt_tot = p.res_inv.inorganic.num*p.res_inv.inorganic.wt
			p.res_inv.wt_tot += p.res_inv.inorganic.wt_tot
			p.res_inv.organic.wt_tot = p.res_inv.organic.num*p.res_inv.organic.wt
			p.res_inv.wt_tot += p.res_inv.organic.wt_tot
			p.res_inv.stone.wt_tot = p.res_inv.stone.num*p.res_inv.stone.wt
			p.res_inv.wt_tot += p.res_inv.stone.wt_tot
			p.res_inv.plant.wt_tot = p.res_inv.plant.num*p.res_inv.plant.wt
			p.res_inv.wt_tot += p.res_inv.plant.wt_tot
			p.res_inv.wood_log.wt_tot = p.res_inv.wood_log.num*p.res_inv.wood_log.wt
			p.res_inv.wt_tot += p.res_inv.wood_log.wt_tot
			p.res_inv.wood_scrap.wt_tot = p.res_inv.wood_scrap.num*p.res_inv.wood_scrap.wt
			p.res_inv.wt_tot += p.res_inv.wood_scrap.wt_tot
			*/
			
		#endregion
		
	#endregion
	
}