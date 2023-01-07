if(pop <= 0 && attacker != undefined)
{
	owner = attacker.owner;
	attacking = undefined;
}

if(owner != ownership.Neutral && p_type == types.barracks)
{
	pop += soldier_growth_rate/room_speed;	
}

if(p_type == types.gatherer)
{
	if(owner == obj_player.playerId)
	{
		global.energy += energy_gathering_rate/room_speed;	
	}else
	{
		with(obj_player_server)
		{
			energy += other.energy_gathering_rate/room_speed;	
			update_player_stats(playerId);
		}	
	}
}