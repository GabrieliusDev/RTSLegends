// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hero_warrior_status_update(){
	if(current_time - lastActionHappenedAt >= timeAfterStartingToGetBored)
	{
		if(boredom + boredomChangeAmount <= maxboredom)
			boredom += 	boredomChangeAmount;
		else if(boredom + boredomChangeAmount > maxboredom)
			boredom = maxboredom;
	}

	if(boredom >= boredomThreshold && random(100) <= 33 && attacking == undefined)
	{
		hero_find_action();
		boredom *= 0.5;
	}

	alarm[0] = speedOfStatusUpdates;
}