function send_data_to_all_players(server_buffer = argument0){
	var size = ds_list_size(con_server.socket_list);
	for(var i = 0; i < size; i++)
	{
		var socket = ds_list_find_value(con_server.socket_list, i);
		network_send_packet(socket, server_buffer, buffer_tell(server_buffer));
	}
}