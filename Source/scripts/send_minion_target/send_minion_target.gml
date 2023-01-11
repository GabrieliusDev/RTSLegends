// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function send_minion_target(objectId = argument0, incombat = argument1, hasTarget = argument2, attackingId = argument3){
	server_buffer = con_server.server_buffer;
	buffer_seek(server_buffer, buffer_seek_start, 0);
	buffer_write(server_buffer, buffer_u8, network.minion_target_update);
	buffer_write(server_buffer, buffer_u16, objectId);
	buffer_write(server_buffer, buffer_bool, incombat);
	buffer_write(server_buffer, buffer_bool, hasTarget);
	if(hasTarget)
		buffer_write(server_buffer, buffer_u16, attackingId);
	else
		buffer_write(server_buffer, buffer_u16, 0);
	send_data_to_all_players(server_buffer);
}