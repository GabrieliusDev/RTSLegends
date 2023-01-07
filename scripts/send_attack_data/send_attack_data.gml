function send_attack_data(p_parent = argument0, p_attacking = argument1){
	client_buffer = con_client.client_buffer;
	buffer_seek(client_buffer, buffer_seek_start, 0);
//	buffer_write(client_buffer, buffer_u8, network.attack_order);			
	buffer_write(client_buffer, buffer_u8, p_parent);
	buffer_write(client_buffer, buffer_u8, p_attacking);
	network_send_packet(con_client.client, client_buffer, buffer_tell(client_buffer));
}