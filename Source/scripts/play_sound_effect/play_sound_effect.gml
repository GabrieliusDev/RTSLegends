// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function play_sound_effect(fxType = argument0){
	switch(fxType)
	{
		case soundEffect.fx_attack_sword:
			var distToPlayer = distance_to_object(obj_player);
			var maxFxDist = view_hport[0]/2
			var maxSound = 0.75;
			if(distToPlayer <= maxFxDist)
			{
				var chooseSound = floor(random_range(1,2));
				switch(chooseSound)
				{
					case 1:
						audio_play_sound(attack_sword_1, 1, false, (1 - (distToPlayer / maxFxDist)) * maxSound);
					break;
					case 2:
						audio_play_sound(attack_sword_3, 1, false, (1 - (distToPlayer / maxFxDist)) * maxSound);
						//audio_play_sound(attack_sword_2, 1, false, (1 - (distToPlayer / maxFxDist)) * maxSound);
					break;
					case 3:
						
					break;
				}
			}
		break;
	}
}