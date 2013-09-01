#define GUI_GRID_X 0
#define GUI_GRID_Y 0
#define GUI_GRID_W 0.025
#define GUI_GRID_H 0.04

class RscTitles {
	class FLAY_RscWaveHUD
	{
		idd = 70000;
		movingEnable=1;
		enableSimulation=1;
		enableDisplay=1;
		duration=999999;
		onLoad = "uiNamespace setVariable ['FLAY_RscWaveHUD',_this select 0];";
		onUnload = "uiNamespace setVariable ['FLAY_RscWaveHUD',nil];";
		class Controls
		{
		
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by mrflay, v1.062, #Qabira)
////////////////////////////////////////////////////////

class RscText_1000: RscText
{
	idc = 1000;
	x = 0.00729166 * safezoneW + safezoneX;
	y = 0.016 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0,0,0,0.2};
	colorText[] = {1,1,1,1};
	text = "Wave: 1 of 5";
	font = "PuristaMedium";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.5)";		
};

class RscText_1001: RscText
{
	idc = 1001;
	x = 0.00729163 * safezoneW + safezoneX;
	y = 0.038 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.044 * safezoneH;
	colorBackground[] = {0,0,0,0.2};
	colorText[] = {1,1,1,1};
	text = "0";
	font = "PuristaBold";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";	
};
class RscText_1002: RscText
{
	idc = 1002;
	x = 0.00729166 * safezoneW + safezoneX;
	y = 0.037 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	text = "Score:";
	font = "PuristaMedium";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.5)";		
};
/*
class RscPicture_1200: RscPicture
{
	idc = 1200;
	text = "\a3\ui_f\data\gui\cfg\Hints\icon_text\group_1_ca.paa";
	x = 0.116146 * safezoneW + safezoneX;
	y = 0.016 * safezoneH + safezoneY;
	w = 0.0114583 * safezoneW;
	h = 0.022 * safezoneH;
};
class RscPicture_1201: RscPicture
{
	idc = 1201;
	text = "\a3\ui_f\data\gui\cfg\Hints\icon_text\group_1_ca.paa";
	x = 0.133333 * safezoneW + safezoneX;
	y = 0.016 * safezoneH + safezoneY;
	w = 0.0114583 * safezoneW;
	h = 0.022 * safezoneH;
};
*/
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

		};		
	};
};