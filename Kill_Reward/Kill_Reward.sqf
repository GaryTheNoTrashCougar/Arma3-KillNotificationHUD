player addEventHandler ["Handlescore", {false}];

sleep 0.5;

KillMsg = {
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

VKill = {
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

HSKill = {
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

LRHSKill = {
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

CQBHSKill = {
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

LRKill = {
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

CQBKill = {
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

FriendlyKill = {
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

Suicide = {
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

execVM "Kill_Reward\Kill_Type.sqf";

addMissionEventHandler ["EntityKilled", 
{
	params ["_killed", "_killer"];
	
	if(!local _killer) exitWith {};
		
	_headDamage = _killed getHitPointDamage "HitHead";
	_distance = _killer distance _killed;
	_minDistance = 100;
	_cqbDistance = 2;
	
	VK = {[["VEHICLE KILL "]] call VKill;};
	LRHS = {[[killType]] call LRHSKill;};
	CQBHS = {[[killType]] call CQBHSKill;};
	HS = {[[killType]] call HSKill;};
	LR = {[["LONG RANGE KILL "]] call LRKill;};
	CQB = {[["POINT BLANK KILL "]] call CQBKill;};
	EK = {[["ENEMY KILLED "]] call KillMsg;};
	FK = {[["FRIENDLY KILLED "]] call FriendlyKill;};
	S = {[["SUICIDE "]] call Suicide;};
	
	if (isNull _instigator)
	
	then
	{
		
		_instigator = _killer
		
	};
	
	if (vehicle player isKindOf "LandVehicle" && (_killed isKindOf "CAManBase" && {!((side group _killed) == playerSide)}))
	
	then
	{
		
		_killer addPlayerScores [1, 0, 0, 0, 0];
		_killer addRating 25;
		_killer spawn VK;
		
	};
	
	if (vehicle player isKindOf "LandVehicle" && (_killed isKindOf "CAManBase" && {((side group _killed) == playerSide)}))
	
	then
	{
		
		if (_killer != _killed)
		
		then
		{
		
			_killer addPlayerScores [0, 0, 0, 0, 0];
			_killer spawn FK;
			
		};
		
		if (_killed == _killer)
		
		then
		{
		
			_killer addPlayerScores [0, 0, 0, 0, 0];
			_killer spawn S;
			
		};
		
	};
	
	if (vehicle player isKindOf "Air" && (_killed isKindOf "CAManBase" && {!((side group _killed) == playerSide)}))
	
	then
	{
		
		_killer addPlayerScores [1, 0, 0, 0, 0];
		_killer addRating 25;
		_killer spawn VK;
		
	};
	
	if (vehicle player isKindOf "Air" && (_killed isKindOf "CAManBase" && {((side group _killed) == playerSide)}))
	
	then
	{
		
		if (_killer != _killed)
		
		then
		{
		
			_killer addPlayerScores [0, 0, 0, 0, 0];
			_killer spawn FK;
			
		};
		
		if (_killed == _killer)
		
		then
		{
		
			_killer addPlayerScores [0, 0, 0, 0, 0];
			_killer spawn S;
			
		};
		
	};
	
	if (vehicle player isKindOf "Ship" && (_killed isKindOf "CAManBase" && {!((side group _killed) == playerSide)}))
	
	then
	{
		
		_killer addPlayerScores [1, 0, 0, 0, 0];
		_killer addRating 25;
		_killer spawn VK;
		
	};
	
	if (vehicle player isKindOf "Ship" && (_killed isKindOf "CAManBase" && {((side group _killed) == playerSide)}))
	
	then
	{
		
		if (_killer != _killed)
		
		then
		{
		
			_killer addPlayerScores [0, 0, 0, 0, 0];
			_killer spawn FK;
			
		};
		
		if (_killed == _killer)
		
		then
		{
		
			_killer addPlayerScores [0, 0, 0, 0, 0];
			_killer spawn S;
			
		};
		
	};
	
	if (vehicle player == _killer)
	
	then
	{
		
		if (!(vehicle player isKindOf "LandVehicle") && !(vehicle player isKindOf "Air") && !(vehicle player isKindOf "Ship") && (_killed isKindOf "CAManBase" && {!((side group _killed) == playerSide)}))
		
		then
		{
		
			if (_distance >= _minDistance && ({_headDamage >= 1;}))
			
			then
			{
				
				_killer addPlayerScores [1, 0, 0, 0, 0];
				_killer addRating 100;
				_killer spawn LRHS;
				
			}
			else
			{
				
				if (_distance <= _cqbDistance && ({_headDamage >= 1;}))
				
				then
				{
					
					_killer addPlayerScores [1, 0, 0, 0, 0];
					_killer addRating 75;
					_killer spawn CQBHS;
					
				}
				else
				{
				
					if (_distance > _cqbDistance && ({_headDamage >= 1;}))
					
					then
					{
					
						_killer addPlayerScores [1, 0, 0, 0, 0];
						_killer addRating 50;
						_killer spawn HS;
						
					};
					
				};
				
				if (_distance >= _minDistance && ({_headDamage < 1;}))
				
				then
				{
				
					_killer addPlayerScores [1, 0, 0, 0, 0];
					_killer addRating 50;
					_killer spawn LR;
					
				}
				else
				{
				
					if (_distance <= _cqbDistance && ({_headDamage < 1;}))
					
					then
					{
					
						_killer addPlayerScores [1, 0, 0, 0, 0];
						_killer addRating 25;
						_killer spawn CQB;
						
					}
					else
					{
					
						if ((_distance > _cqbDistance && {_distance < _minDistance}) && ({_headDamage < 1;}))
						
						then
						{
						
							_killer addPlayerScores [1, 0, 0, 0, 0];
							_killer spawn EK;
							
						};
						
					};
					
				};
				
			};
			
		};
		
		if (_killed isKindOf "CAManBase" && {((side group _killed) == playerSide)})
		
		then
		{
			if (_killer != _killed)
			
			then
			{
			
				_killer addPlayerScores [0, 0, 0, 0, 0];
				_killer spawn FK;
				
			};
			
			if (_killed == _killer)
			
			then
			{
			
				_killer addPlayerScores [0, 0, 0, 0, 0];
				_killer spawn S;
				
			};
			
		};
		
	};
	
}];
