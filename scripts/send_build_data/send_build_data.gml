// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function send_build_data(xx = argument0, yy = argument1, type = argument2, playerId = argument3){
	client_buffer = con_client.client_buffer;
	buffer_seek(client_buffer, buffer_seek_start, 0);
	//buffer_write(client_buffer, buffer_u8, network.build);
	buffer_write(client_buffer, buffer_u16, xx);
	buffer_write(client_buffer, buffer_u16, yy);
	buffer_write(client_buffer, buffer_u8, type);
	buffer_write(client_buffer, buffer_u8, playerId);
	network_send_packet(con_client.client, client_buffer, buffer_tell(client_buffer));
}