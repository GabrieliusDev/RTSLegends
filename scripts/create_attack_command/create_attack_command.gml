// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_attack_command(player = argument0){
	if(player.isHost == true)
	{	
		player.p_parent.attacking = player.p_attacking;	
		if(player.p_parent != player.p_attacking)
			player.p_attacking.attacker = player.p_parent;
		else
			player.p_parent.attacking = player.p_parent;
	}else
	{
		send_attack_data(player.p_parent.pointId, player.p_attacking.pointId);
	}
}