KC_killMsg =
{
	[
		parseText format ["<t align='right' font='%4' size='%3'>%1</t><br/><t align='right' color='%5' font='%7' size='%6'>+%2</t>", KC_killType, KC_total, KC_sizeN, KC_fontN, KC_colour, KC_sizeS, KC_fontS],
		[safezoneX, safezoneY + safeZoneH * KC_posY, safezoneW * KC_posX, safeZoneH * 0.57], 
		1, 
		3, 
		0.7,
		0
	]
	spawn BIS_fnc_textTiles;
};
