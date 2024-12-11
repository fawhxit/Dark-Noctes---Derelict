/// @description Iterate Prompt

if(active) {
	
	if(done and keyboard_check_pressed(vk_enter))
		active = f
	else if(str_out == str) done = t
	else if(keyboard_check_pressed(vk_enter)) {
		
		str_out = str
		done = t
		
	} else if(i < deli and !done) i += 1
	else if(!done) {
		
		i = 0
		var outLen = string_length(str_out)+1
		str_out = string_copy(str,0,outLen)
		
	}
	
}