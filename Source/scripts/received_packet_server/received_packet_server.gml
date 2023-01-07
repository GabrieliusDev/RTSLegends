buffer = argument0;
socket = argument1;
if(buffer != undefined && socket != undefined){
	msgId = buffer_read(buffer, buffer_u8);

	switch(msgId)
	{
		case network.not_implemented://attack_order:
			var p_parent = buffer_read(buffer, buffer_u8);
			var p_attacking = buffer_read(buffer, buffer_u8);
			
			var p_point = ds_map_find_value(global.Points, p_parent);
			var a_point = ds_map_find_value(global.Points, p_attacking);
					
			if(p_point != a_point)
			{
				p_point.attacking = a_point;	
				a_point.attacker = p_point;
			}
			else
				p_point.attacking = undefined;
	//		break;
//		case network.not_implemented://build:
			var xx = buffer_read(buffer, buffer_u16);
			var yy = buffer_read(buffer, buffer_u16);
			var type = buffer_read(buffer, buffer_u8);
			var playerId = buffer_read(buffer, buffer_u8);

			build_point(xx, yy, type, playerId, true);
			
			break;
	}

}