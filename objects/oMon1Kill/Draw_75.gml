/// @description Kill & Draw

// Init
var kfpct = kfi/kf
var ao = draw_get_alpha()

// BG
draw_set_alpha(kfpct*2)
draw_rectangle_color(0,0,ww,wh,c_black,c_black,c_black,c_black,f)

draw_self()

// Reset Draw Vars
draw_set_alpha(ao)