0 = [] spawn
{
	while {true} do
	{
		{
			_x addEventHandler ["HitPart",
			{
				(_this select 0) params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect"];
				head = ("head" in (_this select 0 select 5));
				if (!(vehicle _shooter isKindOf "LandVehicle") && !(vehicle _shooter isKindOf "Air") && !(vehicle _shooter isKindOf "Ship"))
				then
				{
					if (!((side group _target) isEqualTo playerSide) && (_target isKindOf "CAManBase"))
					then
					{
						if (!isPlayer _target)
						then
						{
							if (isPlayer _shooter)
							then
							{
								altKillType = "HEADSHOT";
							};
						};
					};
				};
			}];
		_x setVariable ["passedThathitPart",TRUE];
		} forEach (allUnits select {isNil {_x getVariable "passedThatHitPart"}});
	sleep 2;
	};
};
