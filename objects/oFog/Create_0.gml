/// @description Init Fog

// Image Setup
image_index = irandom(1)
image_speed = 0
image_alpha = random_range(0,1/2)
image_xscale = wh/sprite_get_height(sprFog)
if(flip()) image_xscale = -image_xscale
image_yscale = image_xscale
if(flip()) image_yscale = -image_yscale
col = irandom_range(192,255)
image_blend = make_color_rgb(col,col,255)

xx = x
rel_factor = gen_rel(noone)
yy = get_rel_bot(random_range(0.1,1.0))
x = s.set.dlt[0]+xx
y = s.set.dlt[1]+yy

sprw = abs(sprite_width*image_xscale)
sprh = abs(sprite_height*image_yscale)

rel_depth_dlt = round(40*-rel_factor)
depth += rel_depth_dlt