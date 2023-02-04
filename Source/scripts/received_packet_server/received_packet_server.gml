buffer = argument0;
socket = argument1;
if(buffer != undefined && socket != undefined){
	msgId = buffer_read(buffer, buffer_u8);

	switch(msgId)
	{
		case network.ask_to_spawn_motivation:			
			var objectId = buffer_read(buffer, buffer_u16);
			var playerId = buffer_read(buffer, buffer_u8);			
			var entity = get_object_by_id(objectId);
			
			if(entity != undefined)
				create_motivation_from_client(entity, playerId);
		break;
	}

}