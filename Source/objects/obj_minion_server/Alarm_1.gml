/// @description Combat
// You can write your code in this editor

if(attacking != undefined && inCombat)
{
	if(attacking.hp > damage){
		lastInteractionWithTargetAt = current_time;
		attacking.hp -= damage;	
		play_sound_effect(soundEffect.fx_attack_sword);		
		var info_box = instance_create_depth(attacking.x, attacking.y, attacking.depth-1, obj_entity_info_box);
		info_box.info = damage;
	}
	else{			
		server_kill_entity(attacking);
		inCombat = false;
	}
	alarm[1] = hitIntervals;
}