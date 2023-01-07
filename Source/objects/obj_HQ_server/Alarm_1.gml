/// @description Spawning minion group
// You can write your code in this editor

if(minionsToSpawn > 0)
{
	spawn_minion(x + 100, y-64, paths.top, playerId);
	spawn_minion(x + 100, y+64, paths.bottom, playerId);
	minionsToSpawn--;
	alarm[1] = spawnTimePerUnit;
}