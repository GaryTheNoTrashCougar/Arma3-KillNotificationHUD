0 = player addEventHandler ["HandleHeal",
{
	_this spawn
	{
		params ["_injured","_healer"];
		sleep 6;
		player setDamage 0;
		player removeItem KC_FAK;
	};
}];
