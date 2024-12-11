/// @description Draw BG

if(room == in_room) {
			
	switch(set.finish.nxti) {
				
		case noone: {
			
			if(M.state == game.finish)
				set.finish.nxti = 0
			break
			
		}
				
		case 0: {
					
			if(M.prompt == noone)
				M.prompt = init_prompt([ww8,wh8,ww-ww8,wh-wh8],set.finish.str0)
			else if(M.prompt.done and !M.prompt.active) {
				
				instance_destroy(M.prompt)
				M.prompt = noone
				set.finish.nxti += 1
				
			}
			break
					
		}
				
		case 1: {
					
			if(M.prompt == noone)
				M.prompt = init_prompt([ww8,wh8,ww-ww8,wh-wh8],set.finish.str1)
			else if(M.prompt.done and !M.prompt.active) {
				
				instance_destroy(M.prompt)
				M.prompt = noone
				set.finish.nxti += 1
				
			}
			break
					
		}
				
		case 2: {
					
			game_end()
					
		}
		
	}
		
}