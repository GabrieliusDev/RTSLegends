/// @description Combat
// You can write your code in this editor

if(attacking != undefined)
{
	if(attacking.hp > damage){
		attacking.hp -= damage;	
		var info_box = instance_create_depth(attacking.x, attacking.y, attacking.depth-1, obj_entity_info_box);
		info_box.info = damage;
	}
	else{	
		server_kill_entity(attacking);
	}
	alarm[1] = hitIntervals;
}