// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function update_all_player_stats(){
	var player_count = ds_list_size(con_server.socket_list);
	for(var i = 1; i <= player_count; i++)
	{
		update_player_stats(i);	
	}
}