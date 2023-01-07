enum ownership
{
	Neutral,
	Player1,
	Player2	
}

enum types
{
	outpost, 
	barracks,
	tower,
	gatherer
}

soldier_growth_rate = 0.5;
energy_gathering_rate = 0.5;

point_create_event(self);