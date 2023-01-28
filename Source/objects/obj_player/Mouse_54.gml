/// @description Insert description here
// You can write your code in this editor

if(obj_player.isHost)
	create_motivation(mouse_x, mouse_y, playerId);
else 
	client_create_motivation(mouse_x, mouse_y, playerId);