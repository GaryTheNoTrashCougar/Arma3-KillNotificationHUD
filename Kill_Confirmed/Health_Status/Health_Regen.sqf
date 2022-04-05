if (!local player) exitWith {};

healthArr = [];
regenTime = 0;

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
			regenTime = 0;
			terminate regen;
		};
	};
};

regenTimer =
{
	while {alive player} 
	do
	{
		regenTime = regenTime + 1;
		sleep 1;
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
			terminate timeUntilRegen;
			regenTime = 0;
			timeUntilRegen = [] spawn regenTimer;
		};
		if ((healthArr select 0) isEqualTo (healthArr select 1) && {playerHealth < 100})
		then
		{
			if (regenTime >= 15)
			then
			{
				regen = [] spawn startRegen;
				terminate timeUntilRegen;
			};
		};
		
		sleep 1;
	};
};
