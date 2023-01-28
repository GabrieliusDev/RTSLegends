#region Timer
var time = floor((current_time-global.TimeOnStart)/1000);
var minutes = floor(time/60);
var seconds = time%60;

var mString = "0";
if(minutes >= 10)
	mString = "";
mString += string(minutes);
var sString = "0";
if(seconds >= 10)
	sString = "";
sString += string(seconds);

draw_set_halign(fa_right);
draw_text(view_wport[0]-5, 12, "Time: " + mString + ":" + sString);
#endregion

draw_set_halign(fa_left);
#region essentials
draw_text(5, 20, "FPS = " + string(fps) + " " + string(global.Ping) + " ms");
#endregion

#region DebugInfo
if(global.DebugOn)
{
	var v_start_pos = 40;
	var v_spacing = 20;
	draw_text_color(5, v_start_pos, "Debug Info:", c_purple, c_purple, c_purple, c_purple, 1);
	draw_text_color(5, v_start_pos + v_spacing * 1 , "IsHost: " + (isHost ? "true" : "false"), c_purple, c_purple, c_purple, c_purple, 1);
	if(playerId != undefined)
	{
		switch(playerId)
		{
			case 1:
				draw_set_color(c_blue);
				draw_text(5, v_start_pos + v_spacing * 2,"Player " + string(playerId));
				draw_set_color(c_white);
			break;
			case 2:
				draw_set_color(c_orange);
				draw_text(5, v_start_pos + v_spacing * 2,"Player " + string(playerId));
				draw_set_color(c_white);
			break;
		}
	}
	
	var pos = 3;
	draw_text(5, v_start_pos + v_spacing * 3, "Motivations Count: " + string(ds_map_size(global.Motivations)));
	draw_text(5, v_start_pos + v_spacing * 4, "OwnMotivations Count: " + string(ds_map_size(global.OwnMotivations)));
	draw_text(5, v_start_pos + v_spacing * 5, "Combat Entity Count: " + string(ds_map_size(global.CombatEntities)));
	draw_text(5, v_start_pos + v_spacing * 6, "Minions Count: " + string(ds_map_size(global.Minions)));
	draw_text(5, v_start_pos + v_spacing * 7, "Heroes Count: " + string(ds_map_size(global.Heroes)));
	/*for (var k = ds_map_find_first(global.Motivations); !is_undefined(k); k = ds_map_find_next(global.Motivations, k)) {
		var entity = global.Motivations[? k];
		if(entity != undefined){
			draw_text(100, 20*pos, string(entity.objectId) + " " + string(entity));
			pos++;
		}
	}*/
}
#endregion