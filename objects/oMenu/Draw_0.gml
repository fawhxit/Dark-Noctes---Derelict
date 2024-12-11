/// @description Draw Menu BG

if(room == rMenu) {
	
	#region Init Draw BG
		
		if(cov.pct <= 0) {
			
			BG.xx = BG.dlt[0]+BG.off[0]
			BG.yy = BG.dlt[1]+BG.off[1]
			
		} else {
			
			if(cov.left or cov.last_cover == verb.hide_left)
				BG.xx = (BG.dlt[0]*(1-(0.75*cov.pct)))+BG.off[0]
			else if(cov.right or cov.last_cover == verb.hide_right)
				BG.xx = ((BG.dlt[0]*(1-(0.75*cov.pct)))+BG.dlt_mx[0]*(0.75*cov.pct))+BG.off[0]
			BG.yy = ((BG.dlt[1]*(1-(0.75*cov.pct)))+(BG.dlt_mx[1]*(0.75*cov.pct)))+BG.off[1]
			
		}
		
	#endregion
	
	/* Disabled
	#region Init Draw MGL
		
		if(cov.pct <= 0) {
			
			MGL.xx = MGL.dlt[0]+MGL.off[0]
			MGL.yy = MGL.dlt[1]+MGL.off[1]
			
		} else {
			
			if(cov.left or cov.last_cover == verb.hide_left)
				MGL.xx = (MGL.dlt[0]*(1-(0.75*cov.pct)))+MGL.off[0]
			else if(cov.right or cov.last_cover == verb.hide_right)
				MGL.xx = ((MGL.dlt[0]*(1-(0.75*cov.pct)))+MGL.dlt_mx[0]*(0.75*cov.pct))+MGL.off[0]
			MGL.yy = ((MGL.dlt[1]*(1-(0.75*cov.pct)))+(MGL.dlt_mx[1]*(0.75*cov.pct)))+MGL.off[1]
			
		}
		
	#endregion
	
	#region Init Draw MGR
		
		if(cov.pct <= 0) {
			
			MGR.xx = MGR.dlt[0]+MGR.off[0]
			MGR.yy = MGR.dlt[1]+MGR.off[1]
			
		} else {
			
			if(cov.left or cov.last_cover == verb.hide_left)
				MGR.xx = (MGR.dlt[0]*(1-(0.75*cov.pct)))+MGR.off[0]
			else if(cov.right or cov.last_cover == verb.hide_right)
				MGR.xx = ((MGR.dlt[0]*(1-(0.75*cov.pct)))+MGR.dlt_mx[0]*(0.75*cov.pct))+MGR.off[0]
			MGR.yy = ((MGR.dlt[1]*(1-(0.75*cov.pct)))+(MGR.dlt_mx[1]*(0.75*cov.pct)))+MGR.off[1]
			
		}
		
	#endregion

	#region Init Draw FG
		
		if(cov.pct <= 0) {
			
			FG.xx = FG.dlt[0]+FG.off[0]
			FG.yy = FG.dlt[1]+FG.off[1]
			
		} else {
			
			if(cov.left or cov.last_cover == verb.hide_left)
				FG.xx = (FG.dlt[0]*(1-(0.75*cov.pct)))+FG.off[0]
			else if(cov.right or cov.last_cover == verb.hide_right)
				FG.xx = ((FG.dlt[0]*(1-(0.75*cov.pct)))+FG.dlt_mx[0]*(0.75*cov.pct))+FG.off[0]
			FG.yy = ((FG.dlt[1]*(1-(0.75*cov.pct)))+(FG.dlt_mx[1]*(0.75*cov.pct)))+FG.off[1]
			
		}
		
	#endregion
	*/
	
	#region Do Draw
		
		draw_set_alpha(1)
		draw_sprite_ext(BG.spr,0,BG.xx,BG.yy,BG.scl,BG.scl,0,c_white,1)
		/* Disabled
		draw_sprite_ext(MGL.spr,0,MGL.xx-ww2,MGL.yy-MGL.yo,MGL.scl,MGL.scl,0,c_black,1)
		draw_sprite_ext(MGR.spr,0,MGR.xx+ww2+(MGR.w),MGR.yy-MGR.yo,MGR.scl,abs(MGR.scl),0,c_black,1)
		draw_sprite_ext(FG.spr,0,FG.xx,FG.yy,FG.scl,FG.scl,0,c_black,1)
		*/
		
	#endregion
	
}