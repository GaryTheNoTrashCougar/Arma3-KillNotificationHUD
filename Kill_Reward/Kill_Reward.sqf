player addEventHandler ["Handlescore", {false}];
player addEventHandler ["HandleRating", {0}];

sleep 0.5;

symbol = "";
ratingScore = [];
colour = "";

KillMsg = {
private _messages = _this;
private _messageContent = "<t align='right'>";
{
	private _scoreName = _x select 0;
	ratingScore = ratingScore + 100;
	_messageContent = _messageContent + format ["<t font='PuristaSemibold' size='1.25'>%1</t><br/>", _scoreName];
} 
forEach _messages;
_messageContent = _messageContent + "</t>";
if (ratingScore >= 0) then
{
	_messageContent = _messageContent + (format ["<t align='right' color='%3' font='PuristaBold' size='1.4'>%1%2</t>", symbol, ratingScore, colour]);
};
[
	parseText _messageContent, 
	[safezoneX, safezoneY + safeZoneH * 0.51, safezoneW * 0.62, safeZoneH * 0.57], 
	nil, 
	1, 
	0.7,
	0 
]
spawn BIS_fnc_textTiles;};

addMissionEventHandler ["EntityKilled", 
{
	params ["_killed", "_killer", "_instigator"];
	
	if(!local player) exitWith {};
	
	ratingScore = 0;
	isFriendly = [(side group player),(side group _killed)] call BIS_fnc_sideIsFriendly;
	private _distance = _killer distance _killed;
	private _minDistance = 100;
	private _cqbDistance = 2;
	private _assisters = (_killed getVariable ["shooterIndex",[]]) - [_instigator, objNull];
	_assisters = if (_assisters isEqualTo []) then [{""},{format ["assisters: %1", _assisters apply {name _x}] }];
	
	kill = {[[killType]] call KillMsg;};
	
	if (isNull _instigator)
	then
	{
		_instigator = UAVControl vehicle _killer select 0
	};
	if (isNull _instigator)
	then
	{
		_instigator = _killer
	};
	if (vehicle player isEqualTo _killer)
	then
	{
		if (((vehicle player isKindOf "LandVehicle") || (vehicle player isKindOf "Air") || (vehicle player isKindOf "Ship")) && (_killed isKindOf "CAManBase"))
		then
		{
			if !(isFriendly)
			then
			{
				killType = "VEHICLE KILL";
				symbol = "+";
				ratingScore = -50;
				colour = "#ffff00";
				player addPlayerScores [1, 0, 0, 0, 0];
				player addRating 50;
				player spawn kill;
			}
			else
			{
				if (isFriendly)
				then
				{
					symbol = "-";
					colour = "#ea0000";
					if (_killed isNotEqualTo _killer)
					then
					{
						killType = "FRIENDLY KILL";
						ratingScore = 400;
						player addPlayerScores [0, 0, 0, 0, 0];
						player addRating -500;
						player spawn kill;
					};
					if (_killed isEqualTo _killer)
					then
					{
						killType = "SUICIDE";
						player addPlayerScores [0, 0, 0, 0, 0];
						player addRating -100;
						player spawn kill;
					};
				};
			};
		}
		else
		{
			if ((!(vehicle player isKindOf "LandVehicle") && !(vehicle player isKindOf "Air") && !(vehicle player isKindOf "Ship")) && (_killed isKindOf "CAManBase"))
			then
			{
				if !(isFriendly)
				then
				{
					symbol = "+";
					colour = "#ffff00";
					if (head)
					then
					{
						if (_distance >= _minDistance)
						then
						{
							killType = "HEADSHOT";
							ratingScore = 100;
							player addPlayerScores [1, 0, 0, 0, 0];
							player addRating 200;
							player spawn kill;
						}
						else
						{
							if (_distance <= _cqbDistance)
							then
							{
								killType = "HEADSHOT";
								ratingScore = 75;
								player addPlayerScores [1, 0, 0, 0, 0];
								player addRating 175;
								player spawn kill;
							}
							else
							{
								if ((_distance > _cqbDistance && {_distance < _minDistance}))
								then
								{
									killType = "HEADSHOT";
									ratingScore = 50;
									player addPlayerScores [1, 0, 0, 0, 0];
									player addRating 150;
									player spawn kill;
								};
							};
						};
					}
					else
					{
						if !(head)
						then
						{
							if !(frag)
							then
							{
								if (_distance >= _minDistance)
								then
								{
									killType = "LONG RANGE KILL";
									ratingScore = 50;
									player addPlayerScores [1, 0, 0, 0, 0];
									player addRating 150;
									player spawn kill;
								}
								else
								{
									if (_distance <= _cqbDistance)
									then
									{
										killType = "POINT BLANK KILL";
										ratingScore = 25;
										player addPlayerScores [1, 0, 0, 0, 0];
										player addRating 125;
										player spawn kill;
									}
									else
									{
										if ((_distance > _cqbDistance && {_distance < _minDistance}))
										then
										{
											killType = "ENEMY KILLED";
											player addPlayerScores [1, 0, 0, 0, 0];
											player addRating 100;
											player spawn kill;
										};
									};
								};
							}
							else
							{
								if (frag)
								then
								{
									if (_distance >= _minDistance)
									then
									{
										killType = "EXPLOSIVE KILL";
										ratingScore = 50;
										player addPlayerScores [1, 0, 0, 0, 0];
										player addRating 150;
										player spawn kill;
									}
									else
									{
										if (_distance <= _cqbDistance)
										then
										{
											killType = "EXPLOSIVE KILL";
											ratingScore = 25;
											player addPlayerScores [1, 0, 0, 0, 0];
											player addRating 125;
											player spawn kill;
										}
										else
										{
											if ((_distance > _cqbDistance && {_distance < _minDistance}))
											then
											{
												killType = "EXPLOSIVE KILL";
												player addPlayerScores [1, 0, 0, 0, 0];
												player addRating 100;
												player spawn kill;
											};
										};
									};
								};
							};
						};
					};
				}
				else
				{
					if (isFriendly)
					then
					{
						symbol = "-";
						colour = "#ea0000";
						
						if (_killed isNotEqualTo _killer)
						then
						{
							killType = "FRIENDLY KILL";
							ratingScore = 400;
							player addPlayerScores [0, 0, 0, 0, 0];
							player addRating -500;
							player spawn kill;
						};
						if (_killed isEqualTo _killer)
						then
						{
							killType = "SUICIDE";
							player addPlayerScores [0, 0, 0, 0, 0];
							player addRating -100;
							player spawn kill;
						};
					};
				};
			};
		};
	};
	if ((player in (UAVControl vehicle _killer)) && (_killed isKindOf "CAManBase"))
	then
	{
		if !(isFriendly)
		then
		{
			killType = "DRONE KILL";
			symbol = "+";
			ratingScore = -50;
			colour = "#ffff00";
			player addPlayerScores [1, 0, 0, 0, 0];
			player addRating 50;
			player spawn kill;
		}
		else
		{
			if (isFriendly)
			then
			{
				symbol = "-";
				colour = "#ea0000";
				if (_killed isNotEqualTo _killer)
				then
				{
					killType = "FRIENDLY KILL";
					ratingScore = 400;
					player addPlayerScores [0, 0, 0, 0, 0];
					player addRating -500;
					player spawn kill;
				};
				if (_killed isEqualTo _killer)
				then
				{
					killType = "SUICIDE";
					player addPlayerScores [0, 0, 0, 0, 0];
					player addRating -100;
					player spawn kill;
				};
			};
		};
	};
	if !(vehicle player isEqualTo _killer)
	then
	{
		if (name player in _assisters)
		then
		{
			if !(isFriendly)
			then
			{
				killType = "ASSIST";
				symbol = "+";
				ratingScore = -80;
				colour = "#ffff00";
				player addPlayerScores [0, 0, 0, 0, 0];
				player addRating 20;
				player spawn kill;
			};
		};
	};
}];

0 = [] spawn
{
	while {true} do
	{
		{
			_x addEventHandler ["HitPart",
			{
				(_this select 0) params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect"];
				head = ("head" in (_this select 0 select 5));
				frag = (_isDirect isEqualTo false);
			}];
		_x setVariable ["passedThatHitPart",TRUE];
		} forEach (allUnits select {isNil {_x getVariable "passedThatHitPart"}});
	sleep 2;
	};
};

0 = [] spawn
{
	while {true} do
	{
		{
			_x  setVariable ["shooterIndex",[]];
			_x  addEventHandler ["HandleDamage",
			{
				params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];
				(_unit getVariable "shooterIndex") pushBackUnique _instigator;
				_damage
			}];
		_x setVariable ["passedThatHandleDamage",TRUE];
		} forEach (allUnits select {isNil {_x getVariable "passedThatHandleDamage"}});
	sleep 2;
	};
};
