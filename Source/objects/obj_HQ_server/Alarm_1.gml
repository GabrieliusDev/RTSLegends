/// @description Spawning minion group
// You can write your code in this editor

if(minionsToSpawn > 0)
{
	spawn_minion(x + 32, y, paths.top, playerId);
	spawn_minion(x - 32, y, paths.bottom, playerId);
	minionsToSpawn--;
	alarm[1] = spawnTimePerUnit;
}