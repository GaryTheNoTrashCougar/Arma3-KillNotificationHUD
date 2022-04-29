waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

_uid = getPlayerUID player;

while {true} do
{
	sleep 0.01;
	
	_rscLayer = "Health_Status" call BIS_fnc_rscLayer;
	_rscLayer cutRsc ["Health_Status","PLAIN",1,false];
	
	if (isNull ((uiNamespace getVariable "Health_Status") displayCtrl 90000))
	then
	{
		disableSerialization;
		_rscLayer = "Health_Status" call BIS_fnc_rscLayer;
		_rscLayer cutRsc ["Health_Status","PLAIN",1,false];
	};
	
	_fak1 = {KC_classFAK1 == _x} count (items player);
	_fak2 = {KC_classFAK2 == _x} count (items player);
	_fak3 = {KC_classFAK3 == _x} count (items player);
	_numKits = (_fak1 + _fak2 + _fak3);
	_health = round ((1 - (damage player)) * 100);
	_colDef = parseText "#FBFCFE";  
	_colHurt = parseText "#C72650"; 
	_colDead = parseText "#4D4D4D";

	_colHealth = _colDef;
	if (_health >= 100) then {_colHealth = _colDef;};
	if ((_health >= 50) && (_health < 100)) then {_colHealth = _colDef;};
	if ((_health >= 1) && (_health < 50)) then {_colHealth = _colHurt;};
	if (_health < 1) then {_colHealth = _colDead;};
	
	if (KC_HealthStyle == "HealthIcon")
	then
	{
		((uiNamespace getVariable "Health_Status") displayCtrl 92000) ctrlSetStructuredText parseText format
		["
		<img size='0.75' image='Kill_Confirmed\Health_Status\data\healthIcon_ca.paa'/><t shadow='1' shadowColor='#000000' color='%1'>  %2</t>",
		_colHealth,
		_health
		];
		
		if (KC_showFAK)
		then
		{
			((uiNamespace getVariable "Health_Status") displayCtrl 91998) ctrlSetStructuredText parseText format
			["
			<img size='0.75' image='Kill_Confirmed\Health_Status\data\firstAid_ca.paa'/><t shadow='1' shadowColor='#000000' color='%1'>  %2</t>",
			_colDef,
			_numKits
			];
		};
	};
	
	if (KC_HealthStyle == "HealthBar")
	then
	{
		((uiNamespace getVariable "Health_Status") displayCtrl 91999) ctrlSetStructuredText parseText format
		["
		<t valign='top' shadow='1' shadowColor='#000000' color='%1'>%2  </t><img valign='middle' size='0.6' image='Kill_Confirmed\Health_Status\data\health_%2_ca.paa'/>",
		_colHealth,
		_health
		];
		
		if (KC_showFAK)
		then
		{
			((uiNamespace getVariable "Health_Status") displayCtrl 91997) ctrlSetStructuredText parseText format
			["
			<img size='0.75' image='\Kill_Confirmed\Health_Status\data\firstAid_ca.paa'/><t shadow='1' shadowColor='#000000' color='%1'>  %2</t>",
			_colDef,
			_numKits
			];
		};
	};
};
