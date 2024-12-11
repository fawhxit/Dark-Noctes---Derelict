function gen_rel(rng) {
	
	// If no custom rng set, use main default range
	if(rng == noone)
		return random_range(M.rel_rng[0],M.rel_rng[1])
	else return random_range(rng[0],rng[1])
	
}

function get_rel_bot(rel) {
	
	return (wh*0.6)+((wh*0.4)*(rel/1.34))
	
}