/// @description Start Init

// Init
if(in_room != noone) active = (in_room == room)
if(active) {
	
	rMidx = s.set.w2+s.set.dlt[0]
	rMidy = s.set.h2+s.set.dlt[1]
	
	#region Update List Sizes
		
		sm_sz = ds_list_size(sm_list)
		md_sz = ds_list_size(md_list)
		bg_sz = ds_list_size(bg_list)
		
	#endregion
		
	if(in_room != noone and !init and active) {
		
		#region Pop Small
			
			if(sm_sz < sm_mx) {
				
				do {
					
					ds_list_add(sm_list,instance_create_layer(0,0,"Environment",oStatic))
					var e = sm_list[|sm_sz]
					e.parent = id
					e.static_size = st_type.small
					// Set Sprite
					if(chance(90)) {
						
						// Grass
						switch(irandom(2)){
						
							case 1: e.sprite_index = grass2; break
							case 2: e.sprite_index = grass3; break
							default: e.sprite_index = grass1; break
						
						}
						e.sScl_mn=0.1
						e.sScl_mx=0.333
						e.image_blend = c_green
						e.res = RES.PLANT
						e.res_rng[1] = 1
						e.yield = t
						e.yield_del*=0.5
						
					} else if(flip()) {
						
						// Branch
						switch(irandom(1)){
						
							case 1: e.sprite_index = branch2; break
							default: e.sprite_index = branch1; break
						
						}
						e.sScl_mn=0.2
						e.sScl_mx=0.333
						e.image_blend = c_maroon
						e.image_angle = random(359)
						e.res = RES.WOOD_SCRAP
						e.res_rng[1] = 1
						e.yield = t
						
					} else {
						
						// Rock
						switch(irandom(2)){
						
							 case 1: e.sprite_index = stone2; break
							 case 2: e.sprite_index = stone3; break
							default: e.sprite_index = stone1; break
						
						}
						e.sScl_mn=0.2
						e.sScl_mx=0.333
						if(flip()) e.image_blend = c_dkgray
						else e.image_blend = c_gray
						e.res = RES.STONE
						e.yield = t
						
					}
					e.xx = irandom_range(s.set.w*xrng[0],s.set.w*xrng[1])
					sm_sz += 1
					
				} until(sm_sz >= sm_mx)
				
			}
			
		#endregion
		
		#region Pop Medium
			
			if(md_sz < md_mx) {
				
				do {
					
					ds_list_add(md_list,instance_create_layer(0,0,"Environment",oStatic))
					var e = md_list[|md_sz]
					e.parent = id
					e.static_size = st_type.medium
					e.sprite_index = bush1
					e.image_blend = c_green
					e.res = [RES.PLANT,RES.ORGANIC,RES.WOOD_SCRAP]
					e.yield = t
					e.yield_del*=2.5
					e.xx = irandom_range(s.set.w*xrng[0],s.set.w*xrng[1])
					md_sz += 1
					
				} until(md_sz >= md_mx)
				
			}
			
		#endregion
		
		#region Pop Big
			
			if(bg_sz < bg_mx) {
				
				do {
					
					ds_list_add(bg_list,instance_create_layer(0,0,"Environment",oStatic))
					var e = bg_list[|bg_sz]
					e.parent = id
					e.static_size = st_type.big
					// Set Sprite
					switch(irandom(6)){
						
						case 1: e.sprite_index = dtree2; break
						case 2: e.sprite_index = dtree3; break
						case 3: e.sprite_index = dtree4; break
						case 4: e.sprite_index = dtree5; break
						case 5: e.sprite_index = dtree6; break
						case 6: e.sprite_index = dtree7; break
						default: e.sprite_index = dtree1; break
						
					}
					e.res = [RES.WOOD_LOG,RES.WOOD_SCRAP,RES.ORGANIC]
					e.res_rng = [3,6]
					e.yield = t
					e.yield_del*=5
					if(chance(50)) e.xx = irandom_range(s.set.w*-0.1,s.set.w*.15)
					else e.xx = irandom_range(s.set.w*.85,s.set.w*1.1)
					e.image_blend = c_white
					bg_sz += 1
					
				} until(bg_sz >= bg_mx)
				
			}
			
		#endregion
		
	}
	
	#region Fore Effects
		
		// Init
		var fore = p.fore
		var zi = fore.zi(fore.zmn,fore.zmx,fore.pct)
		
		// Active?
		if(bg_sz > 0) fore.active = t
		else fore.active = f
		
		if(is2(parent))
			parent.set.scl += zi-1
		
	#endregion
	
}