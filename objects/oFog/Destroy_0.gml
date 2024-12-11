/// @description Remake self

if(env.wind_delta > 0) instance_create_layer(-(sprw*0.5),
	irandom_range(M.hRef*.5,M.hRef),"Environment",oFog)
else instance_create_layer(M.wRef+(sprw*0.5),
	irandom_range(M.hRef*.5,M.hRef),"Environment",oFog)