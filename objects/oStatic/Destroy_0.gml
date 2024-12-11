/// @description Add Res DISABLED

// Free Light Surface
if(surface_exists(liteSurf)) {
	
	surface_free(liteSurf)
	liteSurf = noone
	
}

if(yield_do) {
	
	if(!is_array(res)) {
		
		var re = irandom_range(res_rng[0],res_rng[1])
		var br = f
		repeat(re) {
			
			switch(res) {
				
				case RES.UNKNOWN: {
					with(p.res_inv)
						if(unknown.wt < wt_mx-wt_tot) {
							unknown.num += 1
							unknown.wt_tot = unknown.num*unknown.wt
							wt_tot += unknown.wt
						} else br = t
					break
				}
				case RES.INORGANIC: {
					with(p.res_inv)
						if(inorganic.wt < wt_mx-wt_tot) {
							inorganic.num += 1
							inorganic.wt_tot = inorganic.num*inorganic.wt
							wt_tot += inorganic.wt
						} else br = t
					break
				}
				case RES.ORGANIC: {
					with(p.res_inv)
						if(organic.wt < wt_mx-wt_tot) {
							organic.num += 1
							organic.wt_tot = organic.num*organic.wt
							wt_tot += organic.wt
						} else br = t
					break
				}
				case RES.PLANT: {
					with(p.res_inv)
						if(plant.wt < wt_mx-wt_tot) {
							plant.num += 1
							plant.wt_tot = plant.num*plant.wt
							wt_tot += plant.wt
						} else br = t
					break
				}
				case RES.STONE: {
					with(p.res_inv)
						if(stone.wt < wt_mx-wt_tot) {
							stone.num += 1
							stone.wt_tot = stone.num*stone.wt
							wt_tot += stone.wt
						} else br = t
					break
				}
				case RES.WOOD_LOG: {
					with(p.res_inv)
						if(wood_log.wt < wt_mx-wt_tot) {
							wood_log.num += 1
							wood_log.wt_tot = wood_log.num*wood_log.wt
							wt_tot += wood_log.wt
						} else br = t
					break
				}
				case RES.WOOD_SCRAP: {
					with(p.res_inv)
						if(wood_scrap.wt < wt_mx-wt_tot) {
							wood_scrap.num += 1
							wood_scrap.wt_tot = wood_scrap.num*wood_scrap.wt
							wt_tot += wood_scrap.wt
						} else br = t
					break
				}
				
			}
			
			if(br) break
			
		}
		
	} else {
		
		var re = irandom_range(res_rng[0],res_rng[1])
		var br = f
		repeat(re) {
			
			var i = irandom(array_length(res)-1)
			if(i > 0 and flip()) i = 0
			switch(res[i]) {
				
				case RES.UNKNOWN: {
					with(p.res_inv)
						if(unknown.wt < wt_mx-wt_tot) {
							unknown.num += 1
							unknown.wt_tot = unknown.num*unknown.wt
							wt_tot += unknown.wt
						} else br = t
					break
				}
				case RES.INORGANIC: {
					with(p.res_inv)
						if(inorganic.wt < wt_mx-wt_tot) {
							inorganic.num += 1
							inorganic.wt_tot = inorganic.num*inorganic.wt
							wt_tot += inorganic.wt
						} else br = t
					break
				}
				case RES.ORGANIC: {
					with(p.res_inv)
						if(organic.wt < wt_mx-wt_tot) {
							organic.num += 1
							organic.wt_tot = organic.num*organic.wt
							wt_tot += organic.wt
						} else br = t
					break
				}
				case RES.PLANT: {
					with(p.res_inv)
						if(plant.wt < wt_mx-wt_tot) {
							plant.num += 1
							plant.wt_tot = plant.num*plant.wt
							wt_tot += plant.wt
						} else br = t
					break
				}
				case RES.STONE: {
					with(p.res_inv)
						if(stone.wt < wt_mx-wt_tot) {
							stone.num += 1
							stone.wt_tot = stone.num*stone.wt
							wt_tot += stone.wt
						} else br = t
					break
				}
				case RES.WOOD_LOG: {
					with(p.res_inv)
						if(wood_log.wt < wt_mx-wt_tot) {
							wood_log.num += 1
							wood_log.wt_tot = wood_log.num*wood_log.wt
							wt_tot += wood_log.wt
						} else br = t
					break
				}
				case RES.WOOD_SCRAP: {
					with(p.res_inv)
						if(wood_scrap.wt < wt_mx-wt_tot) {
							wood_scrap.num += 1
							wood_scrap.wt_tot = wood_scrap.num*wood_scrap.wt
							wt_tot += wood_scrap.wt
						} else br = t
					break
				}
				
			}
			
			if(br) break
			
		}
		
	}
	
}