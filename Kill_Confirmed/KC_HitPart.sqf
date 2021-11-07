0 = [] spawn
{
	while {true} do
	{
		{
			_x addEventHandler ["HitPart",
			{
				(_this select 0) params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect"];
				KC_head = ("head" in (_this select 0 select 5));
				KC_frag = (_isDirect isEqualTo false);
				_hitSound = selectrandom ["KC_HitSound1","KC_HitSound2","KC_HitSound3","KC_HitSound4","KC_HitSound5","KC_HitSound6","KC_HitSound7","KC_HitSound8"];
				_hitHeadSound = selectrandom ["KC_HitHeadSound1","KC_HitHeadSound2","KC_HitHeadSound3"];
				if ((alive _target) && !(_shooter isEqualTo _target))
				then 
				{
					if (((vehicle player isEqualTo _shooter) || (player in (UAVControl vehicle _shooter))) && (_target isKindOf "CAManBase"))
					then
					{
						if (KC_HitSounds)
						then
						{
							if (KC_head)
							then
							{
								playSound _hitHeadSound;
							}
							else
							{
								playSound _hitSound;
							};
						};
						if (KC_HitMarkers) then {[] spawn KC_HitSelection;};
					};
				};
			}];
		_x setVariable ["passedThathitPart",TRUE];
		} forEach (allUnits select {isNil {_x getVariable "passedThatHitPart"}});
	sleep 2;
	};
};
