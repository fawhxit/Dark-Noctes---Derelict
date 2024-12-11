/// @description Room Lane Init

// Lane Params
parent = s
outdoor = f
shelter = f
in_room = room
active = f

// Lists and Maxes (Small,Medium,Big)
sm_list = ds_list_create()
md_list = ds_list_create()
bg_list = ds_list_create()
sm_sz = 0
md_sz = 0
bg_sz = 0
sm_mx = 50
md_mx = 4
bg_mx = 2

// Misc
init = f
rMidx = dw/2
rMidy = dh/2

// Range
// x
xrng = [.05,.95]
yrng = [M.bot_rng[0],M.bot_rng[1]]

enum st_type {
	
	small,
	medium,
	big
	
}