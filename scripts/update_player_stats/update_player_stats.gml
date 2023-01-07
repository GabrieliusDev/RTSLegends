// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function update_player_stats(playerId = argument0){
	server_buffer = con_server.server_buffer;
	buffer_seek(server_buffer, buffer_seek_start, 0);
	//buffer_write(server_buffer, buffer_u8, network.update_player_stats);
	var player = ds_map_find_value(con_server.socket_to_instanceId, playerId);
	buffer_write(server_buffer, buffer_u16, player.energy);
	network_send_packet(playerId, server_buffer, buffer_tell(server_buffer));
}