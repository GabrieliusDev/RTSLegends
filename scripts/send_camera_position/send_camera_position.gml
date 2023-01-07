// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function send_camera_position(socket = argument0, pos_x = argument1, pos_y = argument2){	
	server_buffer = con_server.server_buffer;
	buffer_seek(server_buffer, buffer_seek_start, 0);
	buffer_write(server_buffer, buffer_u8, network.camera_pos);			
	buffer_write(server_buffer, buffer_u16, pos_x);
	buffer_write(server_buffer, buffer_u16, pos_y);
	network_send_packet(socket, server_buffer, buffer_tell(server_buffer));
}