if (!local player) exitWith {};

healthArr = [];

startRegen =
{
	while {alive player} 
	do
	{
		playerHealth = round ((1 - (damage player)) * 100);
		player setDamage (damage player) - 0.01;
		sleep 1;
		if ((playerHealth isEqualTo 100) || ((healthArr select 0) < (healthArr select 1)))
		then
		{
			terminate regen;
		};
	};
};

if (alive player)
then
{
	while {true}
	do
	{
		playerHealth = round ((1 - (damage player)) * 100);
		healthArr pushback playerHealth;
		reverse healthArr;
		if ((healthArr select 0) < (healthArr select 1))
		then
		{
			[15, false] call BIS_fnc_countdown;
		};
		if ((healthArr select 0) isEqualTo (healthArr select 1) && {playerHealth < 100})
		then
		{
			if (([0] call BIS_fnc_countdown) <= 0)
			then
			{
				regen = [] spawn startRegen;
			};
		};
		
		sleep 1;
	};
 };
