/// @description Spawning minion group
// You can write your code in this editor

if(fps < 55 && ds_map_size(global.CombatEntities) > 100)
	minionsToSpawn = 0;

if(minionsToSpawn > 0)
{
	spawn_minion(x + 32, y, paths.top, playerId);
	spawn_minion(x - 32, y, paths.bottom, playerId);
	minionsToSpawn--;
	alarm[1] = spawnTimePerUnit;
}