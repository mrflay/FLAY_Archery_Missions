//Screen starts black and no sound/music

0 fadeSound 0;
enableRadio false;
enableEnvironment false;
clearRadio;

//Initial showcase video
//"a3\missions_f_beta\video\NIGHT.ogv" spawn BIS_fnc_titlecard;
//waitUntil { !isNil { BIS_fnc_titlecard_finished } };

// Volumetric fog
0 setFog [0, 0.2, 35];
//[] execVM "effects.sqf";

//Establishing Shot
private "_colorEast";
_colorGuer = RESISTANCE call BIS_fnc_sideColor;
_colorGuer set [3, 0.45];
_colorEast = EAST call BIS_fnc_sideColor;
_colorEast set [3, 0.45];

[
	position player,
	"Pythos Island",
	200,
	180,
	100,
	1,
	[
		["\a3\ui_f\data\map\markers\nato\b_inf.paa", _colorGuer, position player, 1, 1, 0, "", 0]
	]
] spawn BIS_fnc_establishingShot;
waitUntil { !isNil { BIS_missionStarted } };

titleText ["", "BLACK FADED", 10];
0 fadeSound 0;
0 fadeMusic 0;
enableRadio false;
enableEnvironment false;
clearRadio;

//Play music and fade in screen, music and sound
[] spawn {
	playMusic "Track10_StageB_action";
	1 fadeMusic 0.18;
	sleep 1;
	titleText ["", "BLACK IN", 3];
	3 fadeSound 0.4;
	enableRadio true;
	enableEnvironment true;
	while { alive player } do {
		sleep 90;
		5 fadeMusic 0;
		playMusic "Track10_StageB_action";
		1 fadeMusic 0.18;
	};
};

//Player stuff

player unassignItem "NVGoggles_INDEP";
player removeItem "NVGoggles_INDEP";

100 cutRsc ["FLAY_RscWaveHUD", "PLAIN", 1];


