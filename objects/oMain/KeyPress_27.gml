/// @description Return to Menu

if(room != rMenu and state == game.play and !controlOverride) {
	
	state = game.pause
	room_goto(rMenu)
	
}