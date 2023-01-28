// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hero_warrior_finding_enemies(){
	if(guarding != undefined)
	{
		var distToGuarding = distance_to_object(guarding);
		if(distToGuarding <= guarding.captureZoneRadius)
		{
			var enemy = find_nearest_enemy();
			var distToEnemy = distance_to_object(enemy);
			if(distToEnemy <= visionRadius)
			{
				attacking = enemy;	
			}
		}
	}

	alarm[1] = speedOfCombatLogicUpdates;
}