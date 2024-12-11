/// @description Room Change Logic

#region In Play and Object Active
	
	if(M.state == game.play) {
		
		if(active) {
			
			if(xx >= s.set.w2) xx += s.set.w*.67
			else xx -= s.set.w*.67
			
		} else active = t
		
	}
	
	if(room == rMenu) active = f
	
#endregion