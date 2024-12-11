/// @description More Global Updates

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
	
	main_step_end()
	
}