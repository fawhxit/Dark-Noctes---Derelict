/// @description Self

if(is(id,oFX,t,t)) {
    
    #region Draw Light
        
        /*
        if(gl_active) {
            
            gpu_set_blendmode(bm_subtract)
            
            draw_set_alpha(lta*glam)
            draw_circle_color(xx,yy,ltr*glrm,ltc[0],ltc[1],f)
            
        }
        */
        
        #region Draw Light FX
			
			gpu_set_blendmode(bm_add)
			
			if(lt_active) {
				
				
				draw_set_alpha(lta)
				draw_circle_color(xx,yy,ltr,ltc[0],ltc[1],f)
				
			}
			
			if(gl_active) {
				
				draw_set_alpha(lta*glam)
				draw_circle_color(xx,yy,ltr*glrm,ltc[0],ltc[1],f)
				
			}
			
			gpu_set_blendmode(bm_normal)
			
        #endregion
        
    #endregion
    
}