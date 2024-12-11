
if(room == rMenu) {
	
	#region Init BG Updatees
		
		BG.sprWH = [sprite_get_width(BG.spr),sprite_get_height(BG.spr)]
		BG.scl = M.hRef/BG.sprWH[1]
		BG.dlt = [((BG.sprWH[0]*BG.scl)-ww)*-M.mx_pct,((BG.sprWH[1]*BG.scl)-wh)*-M.my_pct]
		BG.dlt_mx = [((BG.sprWH[0]*BG.scl)-ww)*-1,((BG.sprWH[1]*BG.scl)-wh)*-1]
		BG.off = [sprite_get_xoffset(BG.spr)*BG.scl,sprite_get_yoffset(BG.spr)*BG.scl]
		
	#endregion
	
	#region BG Ref Updates
		
		BG.w = floor(BG.sprWH[0]*BG.scl)
		BG.h = floor(BG.sprWH[1]*BG.scl)
		BG.w2 = round(BG.w/2)
		BG.h2 = round(BG.h/2)
		BG.w4 = round(BG.w/4)
		BG.h4 = round(BG.h/4)
		BG.w8 = round(BG.w/8)
		BG.h8 = round(BG.h/8)
		
	#endregion
	
	#region Init MGL Updatees
		
		MGL.sprWH = [sprite_get_width(MGL.spr),sprite_get_height(MGL.spr)]
		MGL.scl = M.hRef/MGL.sprWH[1]
		MGL.dlt = [((MGL.sprWH[0]*MGL.scl)-ww)*-M.mx_pct,((MGL.sprWH[1]*MGL.scl)-wh)*-M.my_pct]
		MGL.dlt_mx = [((MGL.sprWH[0]*MGL.scl)-ww)*-1,((MGL.sprWH[1]*MGL.scl)-wh)*-1]
		MGL.off = [sprite_get_xoffset(MGL.spr)*MGL.scl,sprite_get_yoffset(MGL.spr)*MGL.scl]
		
	#endregion
	
	#region MGL Ref Updates
		
		MGL.w = floor(MGL.sprWH[0]*MGL.scl)
		MGL.h = floor(MGL.sprWH[1]*MGL.scl)
		MGL.w2 = round(MGL.w/2)
		MGL.h2 = round(MGL.h/2)
		MGL.w4 = round(MGL.w/4)
		MGL.h4 = round(MGL.h/4)
		MGL.w8 = round(MGL.w/8)
		MGL.h8 = round(MGL.h/8)
		
	#endregion
	
	#region Init MGR Updatees
		
		// Init
		MGR.sprWH = [sprite_get_width(MGR.spr),sprite_get_height(MGR.spr)]
		MGR.scl = -(M.hRef/MGR.sprWH[1])
		MGR.dlt = [((MGR.sprWH[0]*abs(MGR.scl))-ww)*-M.mx_pct,((MGR.sprWH[1]*abs(MGR.scl))-wh)*-M.my_pct]
		MGR.dlt_mx = [((MGR.sprWH[0]*abs(MGR.scl))-ww)*-1,((MGR.sprWH[1]*abs(MGR.scl))-wh)*-1]
		MGR.off = [sprite_get_xoffset(MGR.spr)*MGR.scl,sprite_get_yoffset(MGR.spr)*abs(MGR.scl)]
		
	#endregion
	
	#region MGR Ref Updates
		
		MGR.w = floor(MGR.sprWH[0]*abs(MGR.scl))
		MGR.h = floor(MGR.sprWH[1]*abs(MGR.scl))
		MGR.w2 = round(MGR.w/2)
		MGR.h2 = round(MGR.h/2)
		MGR.w4 = round(MGR.w/4)
		MGR.h4 = round(MGR.h/4)
		MGR.w8 = round(MGR.w/8)
		MGR.h8 = round(MGR.h/8)
		
	#endregion
	
	#region Init FG Updatees
		
		FG.sprWH = [sprite_get_width(FG.spr),sprite_get_height(FG.spr)]
		FG.scl = (M.hRef/FG.sprWH[1])+.1
		FG.dlt = [((FG.sprWH[0]*FG.scl)-ww)*-M.mx_pct,((FG.sprWH[1]*FG.scl)-wh)*-M.my_pct]
		FG.dlt_mx = [((FG.sprWH[0]*FG.scl)-ww)*-1,((FG.sprWH[1]*FG.scl)-wh)*-1]
		FG.off = [sprite_get_xoffset(FG.spr)*FG.scl,sprite_get_yoffset(FG.spr)*FG.scl]
		
	#endregion
	
	#region FG Ref Updates
		
		FG.w = floor(FG.sprWH[0]*FG.scl)
		FG.h = floor(FG.sprWH[1]*FG.scl)
		FG.w2 = round(FG.w/2)
		FG.h2 = round(FG.h/2)
		FG.w4 = round(FG.w/4)
		FG.h4 = round(FG.h/4)
		FG.w8 = round(FG.w/8)
		FG.h8 = round(FG.h/8)
		
	#endregion
	
	
	MGR.dlt = [lerp(BG.dlt[0],FG.dlt[0],.5),lerp(BG.dlt[1],FG.dlt[1],.5)]
	MGL.dlt = [lerp(BG.dlt[0],FG.dlt[0],.5),lerp(BG.dlt[1],FG.dlt[1],.5)]
	
}