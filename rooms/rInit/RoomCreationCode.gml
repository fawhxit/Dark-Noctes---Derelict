
// Init
random_set_seed(((current_year*current_month)/current_day)
	+abs((current_hour-current_minute)*current_second))
randomize()
init_()

// Create Global Objects
#macro M global.main_instance
M = instance_create_layer(0,0,"Logic",oMain)