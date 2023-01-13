// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function update_entity(entity = argument0){
	switch(entity.eType)
	{
		case entityType.point:
			server_buffer = con_server.server_buffer;
			buffer_seek(server_buffer, buffer_seek_start, 0);
			buffer_write(server_buffer, buffer_u8, network.entity_update);
			buffer_write(server_buffer, buffer_u8, entityType.point);
			buffer_write(server_buffer, buffer_u8, entity.objectId);
			buffer_write(server_buffer, buffer_u8, entity.takenAmount);
			buffer_write(server_buffer, buffer_u8, entity.takingFor);
			buffer_write(server_buffer, buffer_u32, entity.lastTimeTrigered);
			send_data_to_all_players(server_buffer);
		break;
	}
}