addMissionEventHandler ["EntityKilled", 
{
	params ["_killed", "_killer", "_instigator"];
	
	if(!local _killer) exitWith {};
	
	KC_nameKiller = name _killer;
	KC_nameKilled = name _killed;
	KC_isFriendly = [(side group _killer),(side group _killed)] call BIS_fnc_sideIsFriendly;
	private _distance = _killer distance _killed;
	private _cqbDistance = 2;
	private _assisters = (_killed getVariable ["shooterIndex",[]]) - [_instigator, objNull];
	_assisters = if (_assisters isEqualTo []) then [{""},{format ["assisters: %1", _assisters apply {name _x}] }];
	
	if (isNull _instigator)
	then
	{
		_instigator = _killer
	};
	if (((driver (vehicle player)) isEqualTo player) && (player isEqualTo _killer))
	then
	{
		if (((vehicle player isKindOf "LandVehicle") || (vehicle player isKindOf "Air") || (vehicle player isKindOf "Ship")) && (_killed isKindOf "CAManBase"))
		then
		{
			if !(KC_isFriendly)
			then
			{
				KC_playerKillCount = KC_playerKillCount + 1;
				if (KC_KillSounds) then {playSound "KC_KillSound";};
				if (KC_KillMarkers) then {[] spawn KC_KillMarker;};
				if (KC_nameKilled isEqualTo (KC_lastKiller select 0))
				then
				{
					KC_killType = "PAYBACK";
					KC_lastKiller = [""];
					KC_ratingScore = 75;
					KC_scoreXP = KC_scoreXP + 75;
					player addRating 75;
					player spawn KC_kill;
				}
				else
				{
					KC_killType = "ROAD KILL";
					KC_ratingScore = 50;
					KC_scoreXP = KC_scoreXP + 50;
					player addRating 50;
					player spawn KC_kill;
				};
			};
		}
		else
		{
			if ((!(vehicle player isKindOf "LandVehicle") && !(vehicle player isKindOf "Air") && !(vehicle player isKindOf "Ship")) && (_killed isKindOf "CAManBase"))
			then
			{
				if !(KC_isFriendly)
				then
				{
					KC_playerKillCount = KC_playerKillCount + 1;
					if (KC_KillMarkers) then {[] spawn KC_KillMarker;};
					if (KC_head)
					then
					{
						if (KC_KillSounds) then {playSound "KC_HeadshotSound";};
						if (KC_nameKilled isEqualTo (KC_lastKiller select 0))
						then
						{
							KC_killType = "PAYBACK";
							KC_lastKiller = [""];
							if (_distance >= KC_longshotDist)
							then
							{
								KC_ratingScore = 250;
								KC_scoreXP = KC_scoreXP + 250;
								player addRating 250;
								player spawn KC_kill;
							}
							else
							{
								if (_distance <= _cqbDistance)
								then
								{
									KC_ratingScore = 225;
									KC_scoreXP = KC_scoreXP + 225;
									player addRating 225;
									player spawn KC_kill;
								}
								else
								{
									if ((_distance > _cqbDistance && {_distance < KC_longshotDist}))
									then
									{
										KC_ratingScore = 200;
										KC_scoreXP = KC_scoreXP + 200;
										player addRating 200;
										player spawn KC_kill;
									};
								};
							};
						}
						else
						{
							KC_killType = "HEADSHOT";
							if (_distance >= KC_longshotDist)
							then
							{
								KC_ratingScore = 200;
								KC_scoreXP = KC_scoreXP + 200;
								player addRating 200;
								player spawn KC_kill;
							}
							else
							{
								if (_distance <= _cqbDistance)
								then
								{
									KC_ratingScore = 175;
									KC_scoreXP = KC_scoreXP + 175;
									player addRating 175;
									player spawn KC_kill;
								}
								else
								{
									if ((_distance > _cqbDistance && {_distance < KC_longshotDist}))
									then
									{
										KC_ratingScore = 150;
										KC_scoreXP = KC_scoreXP + 150;
										player addRating 150;
										player spawn KC_kill;
									};
								};
							};
						};
					}
					else
					{
						if !(KC_head)
						then
						{
							if (KC_KillSounds) then {playSound "KC_KillSound";};
							if !(KC_frag)
							then
							{
								if (KC_nameKilled isEqualTo (KC_lastKiller select 0))
								then
								{
									KC_killType = "PAYBACK";
									KC_lastKiller = [""];
									if (_distance >= KC_longshotDist)
									then
									{
										KC_ratingScore = 200;
										KC_scoreXP = KC_scoreXP + 200;
										player addRating 200;
										player spawn KC_kill;
									}
									else
									{
										if (_distance <= _cqbDistance)
										then
										{
											KC_ratingScore = 175;
											KC_scoreXP = KC_scoreXP + 175;
											player addRating 175;
											player spawn KC_kill;
										}
										else
										{
											if ((_distance > _cqbDistance && {_distance < KC_longshotDist}))
											then
											{
												KC_ratingScore = 150;
												KC_scoreXP = KC_scoreXP + 150;
												player addRating 150;
												player spawn KC_kill;
											};
										};
									};
								}
								else
								{
									if (_distance >= KC_longshotDist)
									then
									{
										KC_killType = "LONG RANGE KILL";
										KC_ratingScore = 150;
										KC_scoreXP = KC_scoreXP + 150;
										player addRating 150;
										player spawn KC_kill;
									}
									else
									{
										if (_distance <= _cqbDistance)
										then
										{
											KC_killType = "POINT BLANK KILL";
											KC_ratingScore = 125;
											KC_scoreXP = KC_scoreXP + 125;
											player addRating 125;
											player spawn KC_kill;
										}
										else
										{
											if ((_distance > _cqbDistance && {_distance < KC_longshotDist}))
											then
											{
												KC_killType = "ENEMY KILLED";
												KC_ratingScore = 100;
												KC_scoreXP = KC_scoreXP + 100;
												player addRating 100;
												player spawn KC_kill;
											};
										};
									};
								};
							}
							else
							{
								if (KC_frag)
								then
								{
									if (KC_nameKilled isEqualTo (KC_lastKiller select 0))
									then
									{
										KC_killType = "PAYBACK";
										KC_lastKiller = [""];
										if (_distance >= KC_longshotDist)
										then
										{
											KC_ratingScore = 200;
											KC_scoreXP = KC_scoreXP + 200;
											player addRating 200;
											player spawn KC_kill;
										}
										else
										{
											if (_distance <= _cqbDistance)
											then
											{
												KC_ratingScore = 175;
												KC_scoreXP = KC_scoreXP + 175;
												player addRating 175;
												player spawn KC_kill;
											}
											else
											{
												if ((_distance > _cqbDistance && {_distance < KC_longshotDist}))
												then
												{
													KC_ratingScore = 150;
													KC_scoreXP = KC_scoreXP + 150;
													player addRating 150;
													player spawn KC_kill;
												};
											};
										};
									}
									else
									{
										KC_killType = "EXPLOSIVE KILL";
										if (_distance >= KC_longshotDist)
										then
										{
											KC_ratingScore = 150;
											KC_scoreXP = KC_scoreXP + 150;
											player addRating 150;
											player spawn KC_kill;
										}
										else
										{
											if (_distance <= _cqbDistance)
											then
											{
												KC_ratingScore = 125;
												KC_scoreXP = KC_scoreXP + 125;
												player addRating 125;
												player spawn KC_kill;
											}
											else
											{
												if ((_distance > _cqbDistance && {_distance < KC_longshotDist}))
												then
												{
													KC_ratingScore = 100;
													KC_scoreXP = KC_scoreXP + 100;
													player addRating 100;
													player spawn KC_kill;
												};
											};
										};
									};
								};
							};
						};
					};
				};
			};
		};
	};
	if (vehicle player isEqualTo _killer)
	then
	{
		if (((vehicle player isKindOf "LandVehicle") || (vehicle player isKindOf "Air") || (vehicle player isKindOf "Ship")) && (_killed isKindOf "CAManBase"))
		then
		{
			if !(KC_isFriendly)
			then
			{
				KC_playerKillCount = KC_playerKillCount + 1;
				if (KC_KillSounds) then {playSound "KC_KillSound";};
				if (KC_KillMarkers) then {[] spawn KC_KillMarker;};
				if (KC_nameKilled isEqualTo (KC_lastKiller select 0))
				then
				{
					KC_killType = "PAYBACK";
					KC_lastKiller = [""];
					KC_ratingScore = 75;
					KC_scoreXP = KC_scoreXP + 75;
					player addRating 75;
					player spawn KC_kill;
				}
				else
				{
					KC_killType = "VEHICLE KILL";
					KC_ratingScore = 50;
					KC_scoreXP = KC_scoreXP + 50;
					player addRating 50;
					player spawn KC_kill;
				};
			};
		};
	};
	if ((player in (UAVControl vehicle _killer)) && (_killed isKindOf "CAManBase"))
	then
	{
		if !(KC_isFriendly)
		then
		{
			KC_playerKillCount = KC_playerKillCount + 1;
			if (KC_KillSounds) then {playSound "KC_KillSound";};
			if (KC_KillMarkers) then {[] spawn KC_KillMarker;};
			if (KC_nameKilled isEqualTo (KC_lastKiller select 0))
			then
			{
				KC_killType = "PAYBACK";
				KC_lastKiller = [""];
				KC_ratingScore = 75;
				KC_scoreXP = KC_scoreXP + 75;
				player addRating 75;
				player spawn KC_kill;
			}
			else
			{
				KC_killType = "DRONE KILL";
				KC_ratingScore = 50;
				KC_scoreXP = KC_scoreXP + 50;
				player addRating 50;
				player spawn KC_kill;
			};
		};
	};
	if !((driver (vehicle player)) isEqualTo _killer)
	then
	{
		if (name player in _assisters)
		then
		{
			if !(KC_isFriendly)
			then
			{
				KC_killType = "ASSIST";
				KC_ratingScore = 20;
				KC_scoreXP = KC_scoreXP + 20;
				KC_assists = KC_assists + 1;
				player addRating 20;
				player spawn KC_kill;
			};
		};
	};
	if (player isEqualTo _killed && {player isNotEqualTo _killer})
	then
	{
		[] spawn
		{
			KC_lastKiller pushBackUnique KC_nameKiller;
			reverse KC_lastKiller;
		};
	};
	if (KC_KillFeed)
	then
	{
		if (_killed isKindOf "CAManBase") then
		{
			if (isNull _instigator) then
			{
				_instigator = UAVControl vehicle _killer select 0;
			};
			if (isNull _instigator) then
			{
				_instigator = _killer;
			};
			_distance = _killed distance _instigator;
			_killFeedStatement = format ["%1 killed %2 (%3m)", name _instigator, name _killed, round _distance];
			[_instigator, _killFeedStatement] remoteExec ["globalChat", 0];
			
		};
	};
	if (KC_showScore)
	then
	{
		if (player isEqualTo _killed)
		then
		{
			KC_playerDeathCount = KC_playerDeathCount + 1;
		};
	};
}];
