// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function set_motivation_type(target = argument0, playerId = argument1){
	
	switch(target.eType)
	{
		case entityType.headQuarters:
		case entityType.minion:
		case entityType.hero_warrior:
			if(playerId == target.playerId)
			{
				sprite_index = spr_motivation_defend;
				mType = motivationType.m_defend;
			}else
			{
				sprite_index = spr_motivation_attack;
				mType = motivationType.m_attack;
			}
		break;
		case entityType.point:
			if(playerId == target.takingFor)
			{
				sprite_index = spr_motivation_defend;
				mType = motivationType.m_defend;			
			}else
			{
				sprite_index = spr_motivation_capture;
				mType = motivationType.m_capture;
			}
		break;
	}
}