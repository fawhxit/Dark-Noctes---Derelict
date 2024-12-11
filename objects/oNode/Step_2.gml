/// @description Update Built-in X/Y

// X/Y
x = xx+parent.set.dlt[0]
y = yy+parent.set.dlt[1]

// Update Visibility
dpct = min(1-max(0,min(1,point_distance(x,y,wmx,wmy)/p.flash.rad)),dpctmx)
if(found) dpct = 1-max(0,min(1,point_distance(x,y,wmx,wmy)/p.flash.rad))
bgc[0] = dpct
fgc[0] = dpct

// Trigger Resets
fxDecline = f
fxAccept = f