CD_CompassHUD =
{
	CD_compileComp =
	{
		("Compass_Display" call BIS_fnc_rscLayer) cutRsc ["RscTitleDisplayEmpty", "PLAIN", -1, false];

		with uiNamespace do
		{
			_display = uiNamespace getVariable "RscTitleDisplayEmpty";
			CD_ctrlGrp = _display ctrlCreate ["RscControlsGroup", 94000];
			CD_ctrlGrp ctrlSetPosition [0.4 * safezoneW + safezoneX,0.01111 * safezoneH + safezoneY,0.2 * safezoneW,10 * safezoneH];
			CD_ctrlGrp ctrlCommit 0;

			CD_grpBG = _display ctrlCreate ["RscStructuredText", 94001];
			CD_grpBG ctrlSetBackgroundColor [0, 0, 0, 0.1];
			CD_grpBG ctrlSetPosition [0.4 * safezoneW + safezoneX,0.01111 * safezoneH + safezoneY,0.2 * safezoneW,0.038 * safezoneH];
			CD_grpBG ctrlCommit 0;

			CD_compImg = _display ctrlCreate ["RscPicture", 94002, CD_ctrlGrp];
			CD_compImg ctrlSetText "Kill_Confirmed\Compass_Display\data\compass_ca.paa";
			CD_compImg ctrlCommit 0;

			CD_dirInd = _display ctrlCreate ["RscStructuredText", 94003];
			CD_dirInd ctrlSetPosition [(0.5 * safezoneW + safezoneX)- 0.05,0.01111 * safezoneH + safezoneY,0.1,0.09 * safezoneH];
			CD_dirInd ctrlSetStructuredText parseText ("<t shadow=1><t align='center' size='0.4' font='PuristaLight'>I");
			CD_dirInd ctrlCommit 0;
		};

		CD_ctrlGrp = [uiNamespace getVariable "CD_ctrlGrp"];
		CD_dirInd = [uiNamespace getVariable "CD_dirInd"];
		CD_grpBG = [uiNamespace getVariable "CD_grpBG"];
		CD_compImg = [uiNamespace getVariable "CD_compImg"];
	};

	[] spawn
	{
		while {true} do
		{
			waitUntil
			{
				(!(KC_reqComp) || ((KC_reqComp) && (KC_classComp in (assignedItems player))));
			};
			_compileCompass = [] spawn CD_compileComp;
			addMissionEventHandler ["EachFrame",
			{
				CD_index = _thisEventHandler;
				_screenPos = screenToWorld [0.5,0.5];
				_playerPos = getPos player;
				_bearing = (((((_screenPos select 0) - (_playerPos select 0)) atan2 ((_screenPos select 1) - (_playerPos select 1))) + 360) % 360)/100;
				_width = 0.96 * safezoneW;
				_calc = ((_width/570) * _bearing)* 100 + (_width/570) * 45;
				(CD_compImg#0) ctrlSetPosition [_calc - _calc*2,-0.01,_width,1.8 * safezoneH];
				(CD_compImg#0) ctrlSetText "Kill_Confirmed\Compass_Display\data\compass_ca.paa";;
				(CD_compImg#0) ctrlCommit 0;
			}];
			
			waitUntil
			{
				((KC_reqComp) && !(KC_classComp in (assignedItems player)));
			};
			removeMissionEventHandler ["EachFrame", CD_index];
			ctrlDelete (CD_ctrlGrp#0);
			ctrlDelete (CD_dirInd#0);
			ctrlDelete (CD_grpBG#0);
			terminate _compileCompass;
		};
	};
};

[] spawn
{
	waitUntil {!isNil "BIS_fnc_init"};
	
	while {true} do
	{
		_compHud = [] spawn CD_CompassHUD;
		waitUntil {sleep 1; scriptDone _compHud};
	};

};
true
