function chance(pct) {
	
	return (random_range(0,100) <= pct)
	
}

function near_mouse(inst,dist) {
	
	return (point_distance(wmx,wmy,inst.x,inst.y) <= dist)
	
}

function flip(){
	
	if(irandom(1) == 1) return t
	else return f
	
}

function check_inv(inst) {
	
	var ret = f
	for(var i = 0; i < ds_list_size(p.inv); i++) {
		
		var e = p.inv[|i]
		
		if(e == inst) ret = t
		
	}
	
	return ret
	
}

function get_empty_inv_slot() {
	
	// Return First Open Slot
	for(var i = 0; i < p.inv_size; i++)
		if(!is2(p.inv[|i])) return i
	
	// No Empty Slot
	return noone
	
}

function mouse_in_rectangle(xy4) {
	
	var rtn = t
	if(xy4[0] < xy4[2]) rtn = wmx >= xy4[0] and wmx <= xy4[2]
	if(xy4[1] < xy4[3] and rtn) rtn = wmy >= xy4[1] and wmy <= xy4[3]
	if(xy4[0] > xy4[2] and rtn) rtn = wmx <= xy4[0] and wmx >= xy4[2]
	if(xy4[1] > xy4[3] and rtn) rtn = wmy <= xy4[1] and wmy >= xy4[3]
	return rtn
	
}

function mouse_in_circle(xy2,rad) {
	
	return (point_distance(xy2[0],xy2[1],wmx,wmy) <= rad)
	
}

function get_room_nodes_entities(this_room,inst) {
	
	var nods = []
	for(var i = 0; i < instance_number(oNode); i++) {
		
		var e = instance_find(oNode,i)
		
		if(e.in_room == this_room
			and (inst == noone or e != inst))
			nods[i] = e
		
	}
	
	var ents = []
	for(var i = 0; i < instance_number(oEntity); i++) {
		
		var e = instance_find(oEntity,i)
		
		if(e.in_room == this_room
			and (inst == noone or e != inst))
			ents[i] = e
		
	}
	
	return [nods,ents]
	
}

function get_nearest_node_entity(inst) {
	
	// Init
	var nod_ent_2arr = get_room_nodes_entities(inst.in_room,inst)
	var nods = nod_ent_2arr[0]
	var ents = nod_ent_2arr[1]
	var ret = noone
	
	try {
		
		// Scan Nodes
		for(var i = 0; i < array_length(nods); i++) {
			
			var e = nods[i]
			if(!instance_exists(e)) continue
			if(ret == noone) ret = e
			else if(point_distance(e.x,e.y,inst.x,inst.y) < point_distance(ret.x,ret.y,inst.x,inst.y))
				ret = e
			
		}
		
		// Scan Ents
		for(var i = 0; i < array_length(ents); i++) {
			
			var e = ents[i]
			if(ret == noone) ret = e
			else if(point_distance(e.x,e.y,inst.x,inst.y) < point_distance(ret.x,ret.y,inst.x,inst.y))
				ret = e
			
		}
		
	} catch(_ex) {
		
		show_debug_message("Nearest Node/Entity Exception... TOFIX")
		show_debug_message(_ex)
		
	}
	
	// Return; Noone or Closest Node/Entity
	return ret
	
}

function return_drop_item() {
	
	// Init
	var l_sz = ds_list_size(p.inv)
	for(var i = 0; i < l_sz; i++) {
		
		if(p.inv[|i] == noone or p.inv[|i] == p.in_hand) {
			ds_list_delete(p.inv,i)
			i -= 1
		}
		l_sz = ds_list_size(p.inv)
		
	}
	
	if(p.inv_show and (mbrp or keyboard_check_pressed(ord("Q"))) and p.in_hand != noone
		and fd == 0) {
		
		// In Inventory....
		// Put it in inv if free
		if(l_sz < p.inv_size and !keyboard_check_pressed(ord("Q"))) {
			
			ds_list_add(p.inv,p.in_hand)
			fd = 4
			
		} else {
			
			// Drop it on floor
			with(p.in_hand) {
				
				in_room = room
				parent = s
				xpct = random_range(0.333,0.67)
				ypct = random_range(0.8,0.9)
				xx = parent.set.w*xpct
				yy = parent.set.h*ypct
				active = t
				fd = 4
				
			}
			
			// Drop SFX
			var efx = instance_create_layer(0,0,"fgc0",oFX)
			efx.playSFX = sndItemDrop
			efx.playSFXVol = 2/3
			efx.playSFXPit = random_range(.8,1)
			efx.always = t
			
		}
		
		p.in_hand = noone
		
	} else if((mbrp or keyboard_check_pressed(ord("Q"))) and p.in_hand != noone
		and fd == 0) {
		
		// Not in inventory....
		// Put it in inv if free
		if(l_sz < p.inv_size and !keyboard_check_pressed(ord("Q"))) {
			ds_list_add(p.inv,p.
			in_hand)
			fd = 4
			
		} else {
			
			// Drop it on floor
			with(p.in_hand) {
				
				in_room = room
				parent = s
				xpct = random_range(0.333,0.67)
				ypct = random_range(0.8,0.9)
				xx = parent.set.w*xpct
				yy = parent.set.h*ypct
				active = t
				fd = 4
				
			}
			
			// Drop SFX
			var efx = instance_create_layer(0,0,"fgc0",oFX)
			efx.playSFX = sndItemDrop
			efx.playSFXVol = 2/3
			efx.playSFXPit = random_range(.8,1)
			efx.always = t
			
		}
		
		p.in_hand = noone
		
	}
	
}

function is(inst,parent,active,in_room) {
	
	try {
		
		if(!is_undefined(inst)) {
			
			if(inst != noone) {
				
				if(is_undefined(parent) or parent == noone)
					return t // No Parent Check
				else {
					
					// Parent Check
					if(object_exists(parent)
						and inst.object_index == parent) {
						
						if(!active and !in_room)
							return t // Is of Parent; No Other Checks
						else if(active and in_room) {
							
							if(inst.active)
								if(inst.in_room == room)
									return t // Is of Parent, active and in room.
							
						} else if(active and inst.active)
							return t // Is of Parent and active
						else if(in_room and inst.in_room == room)
							return t // Is of Parent and in room
						
					} else if(parent == "int64" and is_int64(inst))
						return t // Is Number (64)
					else if(parent == "inst32" and is_int32(inst))
						return t // Is Number (32)
					else if(parent == "str" and is_string(inst))
						return t // Is String
					else if(parent == "nan" and is_nan(inst))
						return t // Is not a Number
					else if(parent == "arr" and is_array(inst))
						return t // Is Array
					else if(parent == "boo" and is_bool(inst))
						return t // Is Boolean
					else if(parent == "inf" and is_infinity(inst))
						return t // Is Infinity
					else if(parent == "mat" and is_matrix(inst))
						return t // Is Matrix
					else if(parent == "met" and is_method(inst))
						return t // Is Method
					else if(parent == "ptr" and is_ptr(inst))
						return t // Is Pointer
					else if(parent == "real" and is_real(inst))
						return t // Is Real
					else if(parent == "struct" and is_struct(inst))
						return t // Is Struct
					else if(parent == "vec3" and is_vec3(inst))
						return t // Is vec3
					else if(parent == "vec4" and is_vec4(inst))
						return t // Is vec4
						
					
				}
				
			}
			
		}
		
	} catch(_ex) {}
	
	return f
	
}

function is2(inst) {
	
	try {
		
		// Do Checks
		if(!is_undefined(inst))
			if(inst != noone)
				if(inst != f)
					return t // If Is
		
	} catch(_ex) {
		
		show_debug_message(_ex)
		
	}
	
	// If Not
	return f
	
}

function iso(inst,obj) {
	
	try {
		
		if(!is_undefined(inst))
			if(inst != noone)
				if(inst.object_index == obj)
					return t
		
	} catch(_ex) {}
	
	return f
	
}

function gen_string(num,let,len) {
	
	// Init
	var rtn = ""
	
	#region Loop
		
		for(var i = 0; i < len; i++) {
			
			if(num and let) {
				
				// Letter and Number Gen
				if(chance(50)) rtn += gen_letter(t) // Letter
				else rtn += string(irandom(9)) // Number
				
			} else if(num) {
				
				// Number Only
				rtn += string(irandom(9))
				
			} else if(let) {
				
				// Letter Only
				rtn += gen_letter(t)
				
			}
			
		}
		
	#endregion
	
	// Return
	return rtn
	
}

function gen_letter(rcase) {
	
	// Init
	var rtn = noone
	
	#region Pick Letter
		
		switch(irandom(25)) {
			
			case 0: rtn = "a"; break
			case 1: rtn = "b"; break
			case 2: rtn = "c"; break
			case 3: rtn = "d"; break
			case 4: rtn = "e"; break
			case 5: rtn = "f"; break
			case 6: rtn = "g"; break
			case 7: rtn = "h"; break
			case 8: rtn = "i"; break
			case 9: rtn = "j"; break
			case 10: rtn = "k"; break
			case 11: rtn = "l"; break
			case 12: rtn = "m"; break
			case 13: rtn = "n"; break
			case 14: rtn = "o"; break
			case 15: rtn = "p"; break
			case 16: rtn = "q"; break
			case 17: rtn = "r"; break
			case 18: rtn = "s"; break
			case 19: rtn = "t"; break
			case 20: rtn = "u"; break
			case 21: rtn = "v"; break
			case 22: rtn = "w"; break
			case 23: rtn = "x"; break
			case 24: rtn = "y"; break
			case 25: rtn = "z"; break
			
		}
		
	#endregion
	
	// Randomize Case & Return
	if(rtn != noone and rcase and chance(50)) rtn = string_upper(rtn)
	return rtn
	
}

/// @returns val/ul
function lim_pct(val,ll,ul,clamped) {
	
	// Factor Out LL
	val = val-ll
	ul  = ul-ll
	
	// Calc & Return
	if(ul == 0) return noone				// Noone if div by 0
	if(clamped) return clamp(val/ul,0,1)	// Clamped pct 0.0 -> 1.0
	else		return val/ul						// Unclamped pct -inf -> +inf
	
}

/// @returns val (ll -> ml -> ul)
function lim2_pct(val,ll,ml,ul,clamped) {
	
	// Returns
	if(val < ml) {
		
		// Facour Out LL
		val = val-abs(ll)
		ml  = ml-abs(ll)
		
		// Calc & Return
		if(ml == 0) return noone				// Noone if div by 0
		if(clamped) return clamp(val/ml,0,1)	// Clamped pct 0.0 -> 1.0
		else		return val/ml						// Unclamped pct -inf -> +inf
		
	} else if(val > ml) {
		
		// Facour Out ML
		val = val-abs(ml)
		ul = ul-abs(ml)
		
		// Calc & Return
		if(ul == 0) return noone				// Noone if div by 0
		if(clamped) return 1-clamp(val/ul,0,1)	// Clamped pct 0.0 -> 1.0
		else		return 1-(val/ul)					// Unclamped pct -inf -> +inf
		
	} else return 1 // Equal to Middle Limit
	
	// Default
	return noone
	
}

/// @returns invert color
function color_inv(col) {
	
	// Init Color Values
	var r = color_get_red(col)
	var g = color_get_green(col)
	var b = color_get_blue(col)
	
	// Return Color Inverse
	// 255-5 = 250
	// 255-240 = 15
	return make_color_rgb(255-r,255-g,255-b)
	
}

function scene_xypct(xy) {
	
	try {
		
		if(!is_undefined(s) and is_array(xy))
			if(s != noone)
				return [xy[0]/s.set.w,xy[1]/s.set.h]
		
	} catch(_ex) {
		
		show_debug_message("Scene get xypct exception")
		show_debug_message(_ex)
		
	}
	
	return noone
	
}

function scene_xy(xypct) {
	
	try {
		
		if(!is_undefined(s) and is_array(xypct))
			if(s != noone)
				return [xypct[0]*s.set.w,xypct[1]*s.set.h]
		
	} catch(_ex) {
		
		show_debug_message("Scene get xypct exception")
		show_debug_message(_ex)
		
	}
	
	return noone
	
}

function is_string_real(str) {
	
	try {
		
		real(str)
		return t
		
	} catch(_ex) {}
	
	return f
	
}