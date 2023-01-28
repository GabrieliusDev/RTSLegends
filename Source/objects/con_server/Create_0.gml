port = 6510;
max_clients = 2;

network_create_server(network_socket_tcp, port, max_clients);

server_buffer = buffer_create(1024, buffer_fixed, 1);
socket_list = ds_list_create();
socket_to_instanceId = ds_map_create();

playerSpawn_x = 0;
playerSpawn_y = 0;

global.game_started = false;

//global.DebugOn = true;
//start_game(true);