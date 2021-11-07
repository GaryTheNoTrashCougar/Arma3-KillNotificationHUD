class Score_Table
{
	idd = -1;
	duration = 10000000000;
	onLoad = "uiNamespace setVariable ['Score_Table', _this select 0];";
	fadein = 0;
	fadeout = 0;
	movingEnable = 0;
	objects[] = {};
	
	class controls
	{
		class Score_Table_Icons
		{
			idc = 90000;
			x = 0.207 * safezoneW + safezoneX;
			y = 0.008 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
			shadow = 1;
			font = "PuristaSemibold";
			size = "0.022 * safezoneH";
			type = 13;
			style = 2;
			text = "";
			
			class Attributes
			{
				align="center";
				color = "#ffffff";
				font = "PuristaSemibold";
			};
		};
		class Score_Table_Score
		{
			idc = 90001;
			x = 0.1635 * safezoneW + safezoneX;
			y = 0.035 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
			shadow = 1;
			font = "PuristaSemibold";
			size = "0.022 * safezoneH";
			type = 13;
			style = 2;
			text = "";
			
			class Attributes
			{
				align="center";
				color = "#ffffff";
				font = "PuristaSemibold";
			};
		};
		class Score_Table_Kills
		{
			idc = 90002;
			x = 0.1948 * safezoneW + safezoneX;
			y = 0.035 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
			shadow = 1;
			font = "PuristaSemibold";
			size = "0.022 * safezoneH";
			type = 13;
			style = 2;
			text = "";
			
			class Attributes
			{
				align="center";
				color = "#ffffff";
				font = "PuristaSemibold";
			};
		};
		class Score_Table_Assists
		{
			idc = 90003;
			x = 0.2258 * safezoneW + safezoneX;
			y = 0.035 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
			shadow = 1;
			font = "PuristaSemibold";
			size = "0.022 * safezoneH";
			type = 13;
			style = 2;
			text = "";
			
			class Attributes
			{
				align="center";
				color = "#ffffff";
				font = "PuristaSemibold";
			};
		};
		class Score_Table_Deaths
		{
			idc = 90004;
			x = 0.2571 * safezoneW + safezoneX;
			y = 0.035 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
			shadow = 1;
			font = "PuristaSemibold";
			size = "0.022 * safezoneH";
			type = 13;
			style = 2;
			text = "";
			
			class Attributes
			{
				align="center";
				color = "#ffffff";
				font = "PuristaSemibold";
			};
		};
	};
};
