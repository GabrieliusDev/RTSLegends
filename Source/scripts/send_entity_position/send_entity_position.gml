// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function send_entity_position(type = argument0, xx = argument1, yy = argument2, objectId = argument3){
	server_buffer = con_server.server_buffer;
	buffer_seek(server_buffer, buffer_seek_start, 0);
	buffer_write(server_buffer, buffer_u8, network.entity_pos_update);	
	buffer_write(server_buffer, buffer_u8, type);
	buffer_write(server_buffer, buffer_u16, xx);
	buffer_write(server_buffer, buffer_u16, yy);	
	buffer_write(server_buffer, buffer_u16, objectId);
	send_data_to_all_players(server_buffer);
}