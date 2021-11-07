class Health_Status
{
	idd = -1;
	duration = 10000000000;
	onLoad = "uiNamespace setVariable ['Health_Status', _this select 0];";
	fadein = 0;
	fadeout = 0;
	movingEnable = 0;
	objects[] = {};
	
	class controls
	{
		class Health_Bar_FAK_HUD
		{
			idc = 91997;
			x = 0.837 * safezoneW + safezoneX;
			y = 0.955 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
			shadow = 1;
			font = "PuristaSemibold";
			size = "0.03 * safezoneH";
			type = 13;
			style = 2;
			text = "";
			
			class Attributes
			{
				align="left";
				color = "";
				font = "PuristaSemibold";
			};
		};
		class Health_Status_FAK_HUD
		{
			idc = 91998;
			x = 0.8955 * safezoneW + safezoneX;
			y = 0.95 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
			shadow = 1;
			font = "PuristaSemibold";
			size = "0.04 * safezoneH";
			type = 13;
			style = 2;
			text = "";
			
			class Attributes
			{
				align="left";
				color = "";
				font = "PuristaSemibold";
			};
		};
		class Health_Bar_HUD
		{
			idc = 91999;
			x = -0.02 * safezoneW + safezoneX;
			y = 0.92 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
			shadow = 1;
			font = "PuristaSemibold";
			size = "0.035 * safezoneH";
			type = 13;
			style = 2;
			text = "";
			
			class Attributes
			{
				align="right";
				color = "#ea0000";
				font = "PuristaSemibold";
			};
		};
		class Health_Status_HUD
		{
			idc = 92000;
			x = 0.9 * safezoneW + safezoneX;
			y = 0.915 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
			shadow = 1;
			font = "PuristaSemibold";
			size = "0.04 * safezoneH";
			type = 13;
			style = 2;
			text = "";
			
			class Attributes
			{
				align="left";
				color = "#ffffff";
				font = "PuristaSemibold";
			};
		};
	};
};
