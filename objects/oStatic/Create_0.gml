/// @description Init Static

// Params
parent = noone
static_size = noone
size_init = f

// Yield & Resources Type
yield      = f
yield_del  = Gspd
yield_deli = 0
yield_do   = f
res     = RES.UNKNOWN
res_rng = [1,3]

// Relatives
rel_factor = lerp(gen_rel(noone),1,1/3)
rel_mn = 2/3
rel_mx = 1+(1/3)
rel_factor_pct = (rel_factor-rel_mn)/(rel_mx-rel_mn)
image_xscale = s.set.scl*rel_factor
image_yscale = image_xscale
if(flip()) image_xscale = -image_xscale
xx = 0
yy = (s.set.h-wh)+get_rel_bot(rel_factor)
image_alpha = 1
image_index = 0
image_angle = 0
depth_dlt_mx  = 30
rel_depth_dlt = round(depth_dlt_mx*-rel_factor)
depth += rel_depth_dlt
rel_pct = lerp(rel_factor,M.rel_rng[1],0.333)

bounds = noone

r = noone
g = noone
b = noone

liteSurf = noone

sScl_mn = 0.10
sScl_mx = 0.333
mScl_mn = 0.80
mScl_mx = 1.20
bScl_mn = 1.20
bScl_mx = 1.40