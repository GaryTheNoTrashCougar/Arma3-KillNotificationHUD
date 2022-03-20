player addEventHandler ["HandleRating", {0}];

sleep 0.5;

KC_ratingScore = [];
KC_colour = KC_colourS call BIS_fnc_colorRGBtoHTML;
KC_assists = 0;
KC_KillMarker = {};
KC_HitSelection = {};
KC_playerDeathCount = 0;
KC_playerKillCount = 0;
KC_scoreXP = 0;
KC_scoreArr = [];
KC_total = 0;
KC_lastKiller = [""];
KC_killType = "";
KC_kill = 
{
	if (KC_ratingScore > 0)
	then
	{
		if (([0] call BIS_fnc_countdown) <= 0) then {KC_total = 0;};
		[4, false] call BIS_fnc_countdown;
		[] spawn
		{
			KC_scoreArr pushBack KC_ratingScore;
			{KC_total = (_x + KC_total)} forEach KC_scoreArr;
			KC_scoreArr call KC_killMsg;
			KC_scoreArr = [];
		};
	};
};

#include "KC_killMsg.sqf"

if (KC_showScore)
then
{
	if (isMultiplayer)
	then
	{
		[] execVM "Kill_Confirmed\Score_Table\Score_Table_MP.sqf";
	}
	else
	{
		[] execVM "Kill_Confirmed\Score_Table\Score_Table_SP.sqf";
	};
};

if (KC_HealthStatus) then {[] execVM "Kill_Confirmed\Health_Status\Health_Status.sqf";};

if (KC_HealthRegen) then {[] execVM "Kill_Confirmed\Health_Status\Health_Regen.sqf";};

if (KC_HealthFAK) then {[] execVM "Kill_Confirmed\Health_Status\Health_FAK.sqf";};

if (KC_CompDisp) then {[] execVM "Kill_Confirmed\Compass_Display\Compass_Display.sqf";};

if (KC_HitMarkerStyle isEqualTo 1)
then
{
	KC_KillMarker = {cutRsc ["KC_KillMarker1", "PLAIN"]; sleep 0.05; cutRsc ["KC_KillMarker2", "PLAIN"]; sleep 0.05; cutRsc ["KC_KillMarker3", "PLAIN"];};
	KC_HitSelection = {cutRsc ["KC_HitMarker1", "PLAIN"]; sleep 0.05; cutRsc ["KC_HitMarker2", "PLAIN"]; sleep 0.05; cutRsc ["KC_HitMarker3", "PLAIN"];};
};
if (KC_HitMarkerStyle isEqualTo 2)
then
{
	KC_KillMarker = {cutRsc ["KC_KillMarker4", "PLAIN"]; sleep 0.05; cutRsc ["KC_KillMarker5", "PLAIN"]; sleep 0.05; cutRsc ["KC_KillMarker6", "PLAIN"];};
	KC_HitSelection = {cutRsc ["KC_HitMarker4", "PLAIN"]; sleep 0.05; cutRsc ["KC_HitMarker5", "PLAIN"]; sleep 0.05; cutRsc ["KC_HitMarker6", "PLAIN"];};
};
if (KC_HitMarkerStyle isEqualTo 3)
then
{
	KC_KillMarker = {cutRsc ["KC_KillMarker7", "PLAIN"]; sleep 0.05; cutRsc ["KC_KillMarker8", "PLAIN"]; sleep 0.05; cutRsc ["KC_KillMarker9", "PLAIN"];};
	KC_HitSelection = {cutRsc ["KC_HitMarker7", "PLAIN"]; sleep 0.05; cutRsc ["KC_HitMarker8", "PLAIN"]; sleep 0.05; cutRsc ["KC_HitMarker9", "PLAIN"];};
};
if (KC_HitMarkerStyle isEqualTo 4)
then
{
	KC_KillMarker = {cutRsc ["KC_KillMarker10", "PLAIN"]; sleep 0.05; cutRsc ["KC_KillMarker11", "PLAIN"]; sleep 0.05; cutRsc ["KC_KillMarker12", "PLAIN"];};
	KC_HitSelection = {cutRsc ["KC_HitMarker10", "PLAIN"]; sleep 0.05; cutRsc ["KC_HitMarker11", "PLAIN"]; sleep 0.05; cutRsc ["KC_HitMarker12", "PLAIN"];};
};
if (KC_HitMarkerStyle isEqualTo 5)
then
{
	KC_KillMarker = {cutRsc ["KC_KillMarker13", "PLAIN"]; sleep 0.05; cutRsc ["KC_KillMarker14", "PLAIN"]; sleep 0.05; cutRsc ["KC_KillMarker15", "PLAIN"];};
	KC_HitSelection = {cutRsc ["KC_HitMarker13", "PLAIN"]; sleep 0.05; cutRsc ["KC_HitMarker14", "PLAIN"]; sleep 0.05; cutRsc ["KC_HitMarker15", "PLAIN"];};
};
