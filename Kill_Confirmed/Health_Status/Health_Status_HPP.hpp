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
		class Blood_HUD
		{
			idc = 92001;
			x = 0.9 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
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
				color = "#ffffff";
				font = "PuristaSemibold";
			};
		};
		class Heart_Rate_HUD
		{
			idc = 92002;
			x = 0.9 * safezoneW + safezoneX;
			y = 0.9 * safezoneH + safezoneY;
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
				color = "#ffffff";
				font = "PuristaSemibold";
			};
		};
        class Head
		{
            idc = 92003;
            x = 0.85 * safezoneW + safezoneX;
			y = 0.886 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
			shadow = 0;
			font = "PuristaSemibold";
			size = "0.115 * safezoneH";
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
        class Torso
		{
            idc = 92004;
            x = 0.85 * safezoneW + safezoneX;
			y = 0.886 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
			shadow = 0;
			font = "PuristaSemibold";
			size = "0.115 * safezoneH";
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
        class ArmLeft
		{
            idc = 92005;
            x = 0.85 * safezoneW + safezoneX;
			y = 0.886 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
			shadow = 0;
			font = "PuristaSemibold";
			size = "0.115 * safezoneH";
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
        class ArmRight
		{
            idc = 92006;
            x = 0.85 * safezoneW + safezoneX;
			y = 0.886 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
			shadow = 0;
			font = "PuristaSemibold";
			size = "0.115 * safezoneH";
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
        class LegLeft
		{
            idc = 92007;
            x = 0.85 * safezoneW + safezoneX;
			y = 0.886 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
			shadow = 0;
			font = "PuristaSemibold";
			size = "0.115 * safezoneH";
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
        class LegRight
		{
            idc = 92008;
            x = 0.85 * safezoneW + safezoneX;
			y = 0.886 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
			shadow = 0;
			font = "PuristaSemibold";
			size = "0.115 * safezoneH";
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
        class ArmLeft_B
		{
            idc = 92009;
            x = 0.85 * safezoneW + safezoneX;
			y = 0.886 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
			shadow = 0;
			font = "PuristaSemibold";
			size = "0.115 * safezoneH";
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
        class ArmRight_B
		{
            idc = 92010;
            x = 0.85 * safezoneW + safezoneX;
			y = 0.886 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
			shadow = 0;
			font = "PuristaSemibold";
			size = "0.115 * safezoneH";
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
        class LegLeft_B
		{
            idc = 92011;
            x = 0.85 * safezoneW + safezoneX;
			y = 0.886 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
			shadow = 0;
			font = "PuristaSemibold";
			size = "0.115 * safezoneH";
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
        class LegRight_B
		{
            idc = 92012;
            x = 0.85 * safezoneW + safezoneX;
			y = 0.886 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
			shadow = 0;
			font = "PuristaSemibold";
			size = "0.115 * safezoneH";
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
	class controlsBackground
	{
        class Background
		{
            idc = 92013;
            x = 0.85 * safezoneW + safezoneX;
			y = 0.886 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
			shadow = 0;
			font = "PuristaSemibold";
			size = "0.115 * safezoneH";
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
