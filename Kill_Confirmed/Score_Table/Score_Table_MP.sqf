waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

[] spawn
{
	_uid = getPlayerUID player;
	
	while {true} do
	{
		sleep 0.01;
		
		_rscLayer = "Score_Table" call BIS_fnc_rscLayer;
		_rscLayer cutRsc ["Score_Table","PLAIN",1,false];
		
		if (isNull ((uiNamespace getVariable "Score_Table") displayCtrl 90000))
		then
		{
			disableSerialization;
			_rscLayer = "Score_Table" call BIS_fnc_rscLayer;
			_rscLayer cutRsc ["Score_Table","PLAIN",1,false];
		};
		
		_deaths = getPlayerScores player param [4];
		
		((uiNamespace getVariable "Score_Table") displayCtrl 90000) ctrlSetStructuredText parseText format
		["
		<img size='1' image='Kill_Confirmed\Score_Table\data\scoreIcon_ca.paa'/>
		<img size='0.5' image='Kill_Confirmed\Score_Table\data\emptyIcon_ca.paa'/>
		<img size='1' image='Kill_Confirmed\Score_Table\data\killsIcon_ca.paa'/>
		<img size='0.5' image='Kill_Confirmed\Score_Table\data\emptyIcon_ca.paa'/>
		<img size='1' image='Kill_Confirmed\Score_Table\data\assistIcon_ca.paa'/>
		<img size='0.5' image='Kill_Confirmed\Score_Table\data\emptyIcon_ca.paa'/>
		<img size='1' image='Kill_Confirmed\Score_Table\data\deathsIcon_ca.paa'/>"
		];
		
		((uiNamespace getVariable "Score_Table") displayCtrl 90001) ctrlSetStructuredText parseText format
		["
		<t shadow='1' shadowColor='#000000' color='#FFFFFF'>%1</t>
		</t>",
		KC_scoreXP
		];
		
		((uiNamespace getVariable "Score_Table") displayCtrl 90002) ctrlSetStructuredText parseText format
		["
		<t shadow='1' shadowColor='#000000' color='#FFFFFF'>%1</t>
		</t>",
		KC_playerKillCount
		];
		
		((uiNamespace getVariable "Score_Table") displayCtrl 90003) ctrlSetStructuredText parseText format
		["
		<t shadow='1' shadowColor='#000000' color='#FFFFFF'>%1</t>
		</t>",
		KC_assists
		];
		
		((uiNamespace getVariable "Score_Table") displayCtrl 90004) ctrlSetStructuredText parseText format
		["
		<t shadow='1' shadowColor='#000000' color='#FFFFFF'>%1</t>
		</t>",
		_deaths
		];
	};
};
