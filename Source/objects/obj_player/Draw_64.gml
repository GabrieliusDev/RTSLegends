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

draw_text(view_wport[0]-52, 12, "Time: " + mString + ":" + sString);

if(global.DebugOn)
{
	var pos = 2;
	draw_text(100, 20, "size: " + string(ds_map_size(global.CombatEntities)));
	for (var k = ds_map_find_first(global.CombatEntities); !is_undefined(k); k = ds_map_find_next(global.CombatEntities, k)) {
		var entity = global.CombatEntities[? k];
		if(entity != undefined){
			draw_text(100, 20*pos, string(entity.objectId) + " " + string(entity));
			pos++;
		}
	}
}