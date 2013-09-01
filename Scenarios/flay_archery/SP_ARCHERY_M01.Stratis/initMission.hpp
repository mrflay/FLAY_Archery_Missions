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
_colorEast = RESISTANCE call BIS_fnc_sideColor;
_colorEast set [3, 0.45];

[
	[7093.57,5966.02,1.64579],
	"Crash Site, Pythos Island",
	100,
	100,
	270,
	1,
	[
		["\a3\ui_f\data\map\markers\nato\b_air.paa", _colorEast, getMarkerPos "FLAY_markerCrashsite", 1, 1, 0, "Zulu", 0]//,
		//["\a3\ui_f\data\map\markers\nato\b_inf.paa", _colorEast, getMarkerPos "FLAY_markerInfiltrate", 1, 1, 0, "Gemini", 0]
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
	//Play some music
	playMusic "Track09_Night_percussions";
	5 fadeMusic 0.18;
	sleep 3;
	titleText ["", "BLACK IN", 3];
	3 fadeSound 0.4;
	enableRadio true;
	enableEnvironment true;
	
	waitUntil { !isNil { FLAY_EnemyAware } };
	0 fadeSound 1;
	10 fadeMusic 0;
	
	waitUntil { !isNil { FLAY_EnemyAlarmed } };
	playMusic "Track07_ActionDark";
	5 fadeMusic 0.18;	
};

//Player stuff


unitBackpack player addMagazineCargo ["flay_1rnd_broadheadarrow", 15];
unitBackpack player addMagazineCargo ["DemoCharge_Remote_Mag", 3];

player unassignItem "NVGoggles_INDEP";
player removeItem "NVGoggles_INDEP";

// triggers fade out of music when enemy starts firing
player addEventHandler ["firedNear", "if (side (_this select 1) == east) then { FLAY_EnemyAware = true; }; "];

group player setGroupId ["Gemini"];
//player setIdentity "Doug_Masters";
//evac_officer setIdentity "Akir_Nakesh";
//pilot setIdentity "Ted_Masters";

//pilot setDamage 0.6;
boat engineOn true;
