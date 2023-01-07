client = network_create_socket(network_socket_tcp);

connected = network_connect(client, global.ip, 6510);

client_buffer = buffer_create(1024, buffer_fixed, 1);