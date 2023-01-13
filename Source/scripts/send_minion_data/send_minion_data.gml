// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function send_minion_data(entity = argument0){
	server_buffer = con_server.server_buffer;
	buffer_seek(server_buffer, buffer_seek_start, 0);
	buffer_write(server_buffer, buffer_u8, network.minion_data_update);
	buffer_write(server_buffer, buffer_u32, current_time - global.TimeOnStart);
	buffer_write(server_buffer, buffer_u16, entity.objectId);
	buffer_write(server_buffer, buffer_u16, entity.x);
	buffer_write(server_buffer, buffer_u16, entity.y);
	buffer_write(server_buffer, buffer_u16, entity.moveX);
	buffer_write(server_buffer, buffer_u16, entity.moveY);
	buffer_write(server_buffer, buffer_u8, entity.currentIndex);
	buffer_write(server_buffer, buffer_u8, entity.hp);
	buffer_write(server_buffer, buffer_bool, entity.inCombat);
	
	//Capturing target
	buffer_write(server_buffer, buffer_bool, entity.capturing != undefined);
	if(entity.capturing != undefined)
		buffer_write(server_buffer, buffer_u8, entity.capturing.objectId);
	else
		buffer_write(server_buffer, buffer_u8, 0);
		
		
	send_data_to_all_players(server_buffer);
}