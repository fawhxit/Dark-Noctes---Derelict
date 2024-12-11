/// @description Node Shift

// Change Node location when room ends
if(dynamic and shift) {
	
	xpct = random_range(xrng[0],xrng[1])
	ypct = random_range(yrng[0],yrng[1])
	xx = parent.set.w*xpct
	yy = parent.set.h*ypct
	
}