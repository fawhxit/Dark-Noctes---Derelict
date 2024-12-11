/// @description Update Built-in X/Y
x = xx+parent.set.dlt[0]
y = yy+parent.set.dlt[1]

// Enter Msg
if(a >= 1 and !instance_exists(oMsg)) {
	
	var msg = instance_create_layer(0,0,layer,oMsg)
	msg.str = "Press Enter to Continue..."
	msg.trgEnd = vk_enter
	
}

// Scene Control (Enter)
if(kbNTRp and active and !done
	and stri >= array_length(str)-1
	and a >= 1)
	done = t // Scene Done
else if(kbNTRp and active and !done
	and a >= 1) {
	
	// Iterate Scene
	stri++
	a = 0
	
} else if(kbNTRp and active and !done) {
	
	// Skip Transition
	a = 1
	
}

// Destroy?
if(active and done and a <= 0) active = f
if(!active and done) {
	
	s.scene_inst = noone
	instance_destroy(id)
	
}

// Update Visibility
if(done)  a  -= aAcc
else  a += aAcc
a = clamp(a,0,1)
bgc[0] = a
fgc[0] = a