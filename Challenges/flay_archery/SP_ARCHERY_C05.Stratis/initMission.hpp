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

//Establishing Shot
private "_colorEast";
_colorGuer = RESISTANCE call BIS_fnc_sideColor;
_colorGuer set [3, 0.45];
_colorEast = EAST call BIS_fnc_sideColor;
_colorEast set [3, 0.45];

[
	[7093.57,5966.02,1.64579],
	"Pythos Island",
	150,
	150,
	270,
	1,
	[
		["\a3\ui_f\data\map\markers\nato\b_inf.paa", _colorGuer, position david, 1, 1, 0, "David", 0],
		["\a3\ui_f\data\map\markers\nato\b_air.paa", _colorEast, getPosATL goliath, 1, 1, 0, "Goliath", 0]
	]
] spawn BIS_fnc_establishingShot;
waitUntil { !isNil { BIS_missionStarted } };

// Black out screen after UAV intro sequence
titleText ["", "BLACK FADED", 10];
0 fadeSound 0;
0 fadeMusic 0;
enableRadio false;
enableEnvironment false;
clearRadio;

// Play music and fade in screen, music and sound
[] spawn {
	playMusic "Track07_ActionDark";
	3 fadeMusic 0.18;
	sleep 2;
	titleText ["", "BLACK IN", 3];
	3 fadeSound 0.4;
	enableRadio true;
	enableEnvironment true;
	// loop the track
	while { alive player } do {
		sleep 100;
		5 fadeMusic 0;
		playMusic "Track07_ActionDark";
		3 fadeMusic 0.18;
	};
};

// Player stuff
removeAllWeapons player;
removeHeadgear player;
removeBackpack player;
removeVest player;

player unassignItem "NVGoggles_INDEP";
player removeItem "NVGoggles_INDEP";

group player setGroupId ["RIP"];

enableSaving [false, false];