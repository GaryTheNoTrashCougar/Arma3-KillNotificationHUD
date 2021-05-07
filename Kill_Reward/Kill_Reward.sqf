player addEventHandler ["Handlescore", {false}];

execVM "Kill_Reward\Kill_Type.sqf";

killMessage = {
_messages = _this;
_ratingScore = 0;
_messageContent = "<t align='right' size='1.25'>";
{
	_scoreName = _x select 0;
	_ratingScore = _ratingScore + 200;
	_messageContent = _messageContent + format ["<t font='PuristaSemibold'>%1</t>%2<br/>", _scoreName];
} 
forEach _messages;
_messageContent = _messageContent + "</t>";
if (_ratingScore >= 0) then
{
	_messageContent = _messageContent + (format ["<t align='right' color='#ffff00' font='PuristaBold' size='1.4'>+%1</t>", _ratingScore]);
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

headshotKillMessage = {
_messages = _this;
_ratingScore = 0;
_messageContent = "<t align='right' size='1.25'>";
{
	_scoreName = _x select 0;
	_ratingScore = _ratingScore + 250;
	_messageContent = _messageContent + format ["<t font='PuristaSemibold'>%1</t>%2<br/>", _scoreName];
} 
forEach _messages;
_messageContent = _messageContent + "</t>";
if (_ratingScore >= 0) then
{
	_messageContent = _messageContent + (format ["<t align='right' color='#ffff00' font='PuristaBold' size='1.4'>+%1</t>", _ratingScore]);
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

LRheadshotKillMessage = {
_messages = _this;
_ratingScore = 0;
_messageContent = "<t align='right' size='1.25'>";
{
	_scoreName = _x select 0;
	_ratingScore = _ratingScore + 300;
	_messageContent = _messageContent + format ["<t font='PuristaSemibold'>%1</t>%2<br/>", _scoreName];
} 
forEach _messages;
_messageContent = _messageContent + "</t>";
if (_ratingScore >= 0) then
{
	_messageContent = _messageContent + (format ["<t align='right' color='#ffff00' font='PuristaBold' size='1.4'>+%1</t>", _ratingScore]);
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

CQBheadshotKillMessage = {
_messages = _this;
_ratingScore = 0;
_messageContent = "<t align='right' size='1.25'>";
{
	_scoreName = _x select 0;
	_ratingScore = _ratingScore + 275;
	_messageContent = _messageContent + format ["<t font='PuristaSemibold'>%1</t>%2<br/>", _scoreName];
} 
forEach _messages;
_messageContent = _messageContent + "</t>";
if (_ratingScore >= 0) then
{
	_messageContent = _messageContent + (format ["<t align='right' color='#ffff00' font='PuristaBold' size='1.4'>+%1</t>", _ratingScore]);
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

longRangeMessage = {
_messages = _this;
_ratingScore = 0;
_messageContent = "<t align='right' size='1.25'>";
{
	_scoreName = _x select 0;
	_ratingScore = _ratingScore + 250;
	_messageContent = _messageContent + format ["<t font='PuristaSemibold'>%1</t>%2<br/>", _scoreName];
} 
forEach _messages;
_messageContent = _messageContent + "</t>";
if (_ratingScore >= 0) then
{
	_messageContent = _messageContent + (format ["<t align='right' color='#ffff00' font='PuristaBold' size='1.4'>+%1</t>", _ratingScore]);
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

CQBMessage = {
_messages = _this;
_ratingScore = 0;
_messageContent = "<t align='right' size='1.25'>";
{
	_scoreName = _x select 0;
	_ratingScore = _ratingScore + 225;
	_messageContent = _messageContent + format ["<t font='PuristaSemibold'>%1</t>%2<br/>", _scoreName];
} 
forEach _messages;
_messageContent = _messageContent + "</t>";
if (_ratingScore >= 0) then
{
	_messageContent = _messageContent + (format ["<t align='right' color='#ffff00' font='PuristaBold' size='1.4'>+%1</t>", _ratingScore]);
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

addMissionEventHandler ["EntityKilled", 
{
	params ["_killed", "_killer"];
	
	_headDamage = _killed getHitPointDamage "HitHead";
	_distance = _killer distance _killed;
	_minDistance = 100;
	_cqbDistance = 2;
	
	if (isNull _instigator)
	
	then
	{
	
		_instigator = _killer
		
	};
	
	if (_killed isKindOf "CAManBase" && {((side group _killed) != playerSide)})
	
	then
	{
	
		if (isPlayer _killer && ({_headDamage >= 1;}))
		
		then
		{
	
			if (_distance >= _minDistance && ({_headDamage >= 1;}))
	
			then
			{
		
				player addPlayerScores [1, 0, 0, 0, 0];
				player addRating 100;

				[[killType, _ratingScore]] call LRheadshotKillMessage;
	
			}
			else
			{
	
				if (_distance <= _cqbDistance && ({_headDamage >= 1;}))
	
				then
				{
		
					player addPlayerScores [1, 0, 0, 0, 0];
					player addRating 75;

					[[killType, _ratingScore]] call CQBheadshotKillMessage;
	
				}
				else
				{
				
					if (_distance > _cqbDistance && ({_headDamage >= 1;}))
					
					then
					{
	
						player addPlayerScores [1, 0, 0, 0, 0];
						player addRating 50;

						[[killType, _ratingScore]] call headshotKillMessage;
					
					};
					
				};
				
			};
		
		};
		
		if (isPlayer _killer && ({_headDamage < 1;}))
					
		then
		{
					
			if (_distance >= _minDistance && ({_headDamage < 1;}))
	
			then
			{
	
				player addPlayerScores [1, 0, 0, 0, 0];
				player addRating 50;

				[["LONG RANGE KILL ", _ratingScore]] call longRangeMessage;
		
			}
			else
			{
	
				if (_distance <= _cqbDistance && ({_headDamage < 1;}))
	
				then
				{

					player addPlayerScores [1, 0, 0, 0, 0];
					player addRating 25;

					[["POINT BLANK KILL ", _ratingScore]] call CQBMessage;
		
				}
				else
				{
						
					if (_distance > _cqbDistance && ({_headDamage < 1;}))
				
					then
					{
	
						player addPlayerScores [1, 0, 0, 0, 0];

						[["ENEMY KILLED ", _ratingScore]] call killMessage;
						
					};
					
				};

			};

		};

	};

}];

friendlyKillMessage = {
_messages = _this;
_ratingScore = 0;
_messageContent = "<t align='right' size='1.25'>";
{
	_scoreName = _x select 0;
	_ratingScore = _ratingScore + 1000;
	_messageContent = _messageContent + format ["<t font='PuristaSemibold'>%1</t>%2<br/>", toUpper _scoreName];
} 
forEach _messages;
_messageContent = _messageContent + "</t>";
if (_ratingScore >= 0) then 
{
	_messageContent = _messageContent + (format ["<t align='right' color='#ea0000' font='PuristaBold' size='1.4'>-%1</t>", _ratingScore]);
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

addMissionEventHandler ["EntityKilled", 
{
	params ["_killed", "_killer"];	
	if (isNull _instigator) then {_instigator = _killer}; // player driven vehicle road kill
	
	if (_killed isKindOf "CAManBase" && {((side group _killed) == playerSide)})
	
	then
	{
		if (!isPlayer _killed)
		
		then
		{
		
			if (isPlayer _killer)
			
			then
			{

				player addPlayerScores [0, 0, 0, 0, 0];

				[["FRIENDLY KILLED ", _ratingScore]] call friendlyKillMessage;

			};

		};

	};

}];

suicideMessage = {
_messages = _this;
_ratingScore = 0;
_messageContent = "<t align='right' size='1.25'>";
{
	_scoreName = _x select 0;
	_ratingScore = _ratingScore - 200;
	_messageContent = _messageContent + format ["<t font='PuristaSemibold'>%1</t>%2<br/>", toUpper _scoreName];
} 
forEach _messages;
_messageContent = _messageContent + "</t>";
if (_ratingScore >= 0) then
{
	_messageContent = _messageContent + (format ["<t align='right' color='#ffff00' font='PuristaBold' size='1.4'>+%1</t>", _ratingScore]);
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

sleep 0.5;

addMissionEventHandler ["EntityKilled", 
{
	params ["_killed", "_killer"];	
	if (isNull _instigator) then {_instigator = _killer}; // player driven vehicle road kill
	
	if (_killed isKindOf "CAManBase" && {(isPlayer _killed)} && {(isPlayer _killer)})
	
	then
	{

		player addPlayerScores [0, 0, 0, 0, 0];

		[["SUICIDE ", _ratingScore]] call suicideMessage;

	};

}];
