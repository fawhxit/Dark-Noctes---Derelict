/// @description Kill Scene

#region Kill Scene Logic
	
	if(kill and !instance_exists(oMon1Kill)) {
		
		var inst = instance_create_layer(x,y,"Prompt",oMon1Kill)
		inst.par = id
		inst.gpar = parent
		
	}
	
#endregion