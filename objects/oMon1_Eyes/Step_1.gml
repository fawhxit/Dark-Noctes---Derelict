/// @description Destroy w/ Parent

if(!instance_exists(parent))
	instance_destroy(self)
if(M.dbgMon) p.killer = noone