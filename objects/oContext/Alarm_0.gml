/// @description Relocate?

#region Try Relocate
    
    try {
    	
    	var e = get_nearest_node_entity(id)
    	
    	// Relocate if too close to another
    	if(e != noone and point_distance(e.x,e.y,x,y) < rad*2) {
    		
    		xpct = random_range(xrng[0],xrng[1])
    		ypct = random_range(yrng[0],yrng[1])
    		xx = parent.set.w*xpct
    		yy = parent.set.h*ypct
    		
    	}
    
    } catch(_ex) {
    	
    	show_debug_message("Bad Node/Entity/Contextual Reference? oContextual: Alarm 0. (Relocate?)")
    	show_debug_message(_ex)
    	
    }
    
#endregion