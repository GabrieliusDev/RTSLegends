// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function send_minion_data(objectId = argument0, xx = argument1, yy = argument2, moveX = argument3, moveY = argument4, currentIndex = argument5, hp = argument6, attackingId = argument7, incombat = argument8){
	server_buffer = con_server.server_buffer;
	buffer_seek(server_buffer, buffer_seek_start, 0);
	buffer_write(server_buffer, buffer_u8, network.minion_data_update);
	buffer_write(server_buffer, buffer_u16, objectId);
	buffer_write(server_buffer, buffer_u16, xx);
	buffer_write(server_buffer, buffer_u16, yy);
	buffer_write(server_buffer, buffer_u16, moveX);
	buffer_write(server_buffer, buffer_u16, moveY);
	buffer_write(server_buffer, buffer_u8, currentIndex);
	buffer_write(server_buffer, buffer_u8, hp);
	buffer_write(server_buffer, buffer_u16, attackingId);
	buffer_write(server_buffer, buffer_bool, incombat);
	send_data_to_all_players(server_buffer);
}