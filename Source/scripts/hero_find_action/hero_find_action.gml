// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hero_find_action(){
	if(morale < moraleThreshold)
	{
		//find what to guard
		guarding = find_nearest_point(guarding, true, false);
	}else
	{
		//find what to attack
		
	}
}