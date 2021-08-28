player addEventHandler ["Handlescore", {false}];
player addEventHandler ["HandleRating", {0}];

sleep 0.5;

symbol = "";
ratingScore = [];
colour = "";

KillMsg = {
_messages = _this;
_messageContent = "<t align='right' size='1.25'>";
{
	_scoreName = _x select 0;
	ratingScore = ratingScore + 100;
	_messageContent = _messageContent + format ["<t font='PuristaSemibold'>%1</t>%2<br/>", _scoreName];
} 
forEach _messages;
_messageContent = _messageContent + "</t>";
if (ratingScore >= 0) then
{
	_messageContent = _messageContent + (format ["<t align='right' color='%3' font='PuristaBold' size='1.4'>%1%2</t>", symbol, ratingScore, colour]);
};
[
	parseText _messageContent, 
	[safezoneX, safezoneY + safeZoneH * 0.55, safezoneW * 0.62, safeZoneH * 0.57], 
	nil, 
	1, 
	0.7,
	0 
]
spawn BIS_fnc_textTiles;};

execVM "Kill_Reward\Kill_Type.sqf";
addMissionEventHandler ["EntityKilled", 
{
	params ["_killed", "_killer"];
	
	if(!local _killer) exitWith {};
	
	ratingScore = 0;
	_distance = _killer distance _killed;
	_minDistance = 100;
	_cqbDistance = 2;
	isFriendly = [(side group _killer),(side group _killed)] call BIS_fnc_sideIsFriendly;
	
	kill = {[[killType]] call KillMsg;};
	
	if (isNull _instigator)
	then
	{
		_instigator = _killer
	};
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
			_killer addPlayerScores [1, 0, 0, 0, 0];
			_killer addRating 50;
			_killer spawn kill;
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
					_killer addPlayerScores [0, 0, 0, 0, 0];
					_killer addRating -500;
					_killer spawn kill;
				};
				if (_killed isEqualTo _killer)
				then
				{
					killType = "SUICIDE";
					_killer addPlayerScores [0, 0, 0, 0, 0];
					_killer addRating -100;
					_killer spawn kill;
				};
			};
		};
	};
	if (vehicle player isEqualTo _killer)
	then
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
						_killer addPlayerScores [1, 0, 0, 0, 0];
						_killer addRating 200;
						_killer spawn kill;
					}
					else
					{
						if (_distance <= _cqbDistance)
						then
						{
							killType = "HEADSHOT";
							ratingScore = 75;
							_killer addPlayerScores [1, 0, 0, 0, 0];
							_killer addRating 175;
							_killer spawn kill;
						}
						else
						{
							if ((_distance > _cqbDistance && {_distance < _minDistance}))
							then
							{
								killType = "HEADSHOT";
								ratingScore = 50;
								_killer addPlayerScores [1, 0, 0, 0, 0];
								_killer addRating 150;
								_killer spawn kill;
							};
						};
					};
				}	
				else
				{
					if !(head)
					then
					{
						if (_distance >= _minDistance)
						then
						{
							killType = "LONG RANGE KILL";
							ratingScore = 50;
							_killer addPlayerScores [1, 0, 0, 0, 0];
							_killer addRating 150;
							_killer spawn kill;
						}
						else
						{
							if (_distance <= _cqbDistance)
							then
							{
								killType = "POINT BLANK KILL";
								ratingScore = 25;
								_killer addPlayerScores [1, 0, 0, 0, 0];
								_killer addRating 125;
								_killer spawn kill;
							}
							else
							{
								if ((_distance > _cqbDistance && {_distance < _minDistance}))
								then
								{
									killType = "ENEMY KILLED";
									_killer addPlayerScores [1, 0, 0, 0, 0];
									_killer addRating 100;
									_killer spawn kill;
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
						_killer addPlayerScores [0, 0, 0, 0, 0];
						_killer addRating -500;
						_killer spawn kill;
					};
					if (_killed isEqualTo _killer)
					then
					{
						killType = "SUICIDE";
						_killer addPlayerScores [0, 0, 0, 0, 0];
						_killer addRating -100;
						_killer spawn kill;
					};
				};
			};
		};
	};
}];
