
if(type == ntype.none) {
    
    #region Section Title Draw
        
        // Draw Title
        var fo = draw_get_font()
        draw_set_hvalign([fa_center,fa_middle])
        draw_set_font(fTitle)
        draw_text_ext_color(ww/2,wh/4,stStr,strH,ww*(2/3),
            stFgc[1],stFgc[2],stFgc[3],stFgc[4],stFgc[0])
        draw_set_font(fo)
        
        if(stBgc[0] <= 0) instance_destroy(id)
        
    #endregion Section Title Draw
    
}