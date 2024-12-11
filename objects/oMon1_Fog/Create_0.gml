/// @description Insert description here
// You can write your code in this editor

parent   = noone
ii		 = noone

// Child
// Alpha
image_alpha = 1
a_del = random_range(Gspd*5,Gspd*7)
a_i   = 0
a     = 1 - (a_i/a_del)

// Scale Rate
scl_rate = (image_xscale/a_del)*random_range(1.0,1.25)

// Speed
xx = irandom_range(-25,25)
yy = irandom_range(-25,25)
x += xx
y += yy
xx = x
yy = y
spd  = irandom(359)
xspd = (abs(env.wind_delta))*-(sin(degtorad(spd))/2)
yspd = (abs(env.wind_delta))*(cos(degtorad(spd))/2)
if(env.wind_delta > 0) {
	
	xspd*=-1
	yspd*=-1
	
}

orig_depth = undefined
liteSurf = noone