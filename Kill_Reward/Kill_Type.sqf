0 = [] spawn
{
	while {true} do
	{
		{
			_x addEventHandler ["HitPart",
			{
				(_this select 0) params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect"];
	
				if (_target isKindOf "CAManBase")
	
				then
				{
	
					if (!isPlayer _target)
	
					then
					{
		
						if (isPlayer _shooter)
	
						then
						{
	
							if (_isDirect == true)
	
							then
							{
			
								killType = "HEADSHOT ";
		
							}
							else
							{
								if (_isDirect == false)
					
								then
								{
	
									killType = "EXPLOSIVE KILL ";
					
								};
							};
		
						};

					};

				};

			}];

			_x setVariable ["passedThatHitPart",TRUE];
			
		} forEach (allUnits select {isNil {_x getVariable "passedThatHitPart"}});
		
		sleep 2;
		
	};
};
