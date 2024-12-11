/// @description Init Monster

// Base Vars
parent = M
active = t
scl_mn = .2
scl_mx = 1
scl    = random_range(scl_mn,scl_mx)
scl_pct = ((scl-scl_mn)/(scl_mx-scl_mn))
depth -= 100*scl_pct
image_xscale = scl
image_yscale = scl
xx   = x
yy   = get_rel_bot(random_range(.33,.67))
boundx = noone
spd_pct = 1+scl_pct
behavior = mon.chase
bvrmn = Gspd*8
bvrmx = Gspd*20
bvri = 0
bvrd = random_range(bvrmn,bvrmx)
creepRad = noone

// Monster Scene X Pct
xpct = 0
// Monster Mouse X Pct
mxpct = 0

// Child Instances
eyes = instance_create_layer(xx,yy,"Environment",oMon1_Eyes)
eyes.parent = id
eyes.depth = depth-5
eyes.image_xscale = scl
eyes.image_yscale = scl

// Audio Vars
mon1_emitter = noone
mon2_emitter = noone
sfx1 = noone
sfx2 = noone
sfx3 = noone
sfxEnv = noone
sfxEnvd = Gspd*60
liteSurf = noone

// Frame Vars
f_spd = .5
f_i   = 0

// Debug
dbg_depth = f
dbg_done  = f
dbg_move  = f
dbg_bvr   = f

#region Target-Based Movement Vars
	
	txy = []
	tv = 0
	tvmx = 100
	tacc = 1
	
#endregion

#region Fog
	
	fog_i    = 0
	fog_mx   = 12
	fog_del  = Gspd*(2/3)
	fog_deli = 0
	
	// Init first fog & fog list
	fog_L    = ds_list_create()
	ds_list_add(fog_L,instance_create_layer(xx,yy,"Environment",oMon1_Fog))
	var e    = fog_L[|fog_i]
	e.parent = id
	e.ii     = fog_i
	e.depth = depth+1
	e.image_xscale = scl+1
	e.image_yscale = scl+1
	fog_i   += 1
	
	
#endregion