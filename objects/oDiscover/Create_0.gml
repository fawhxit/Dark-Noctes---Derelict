/// @description Init

#region Base
    
    in_room = room
    active = t
    type = ntype.none
    
#endregion Base

#region Section Title
    
    // Delay
    stDel = Gspd*7
    stDeli = 0
    // String
    stStr = noone
    // Colors
    stFgc = [0.0,c.wht,c.wht,c.gry,c.gry]
    stBgc = [1/3,c.blk,c.blk,c.blk,c.blk]
    // Percent Complete
    stPct = 0
    // Get Flashlight Old (to turn back on after title)
    flasho = p.flash.on
    
#endregion Section Title