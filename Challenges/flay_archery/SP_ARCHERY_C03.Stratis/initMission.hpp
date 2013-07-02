//Disable sounds and radio protocol
0 fadeSound 0;
enableRadio false;
enableEnvironment false;

//Initial showcase video
"a3\missions_f_beta\video\NIGHT.ogv" spawn BIS_fnc_titlecard;
waitUntil { !isNil { BIS_fnc_titlecard_finished } };

//Establishing Shot
private "_colorEast";
_colorEast = EAST call BIS_fnc_sideColor;
_colorEast set [3, 0.33];

[
	[2667.74,1266.46,0],
	localize "Pythos crash site",
	200,
	200,
	270,
	1,
	[
		["\a3\ui_f\data\map\markers\nato\b_inf.paa", _colorEast, getMarkerPos "BIS_markerCampBig", 1, 1, 0, localize "STR_A3_Showcase_Night2_Marker_BIS_markerCampBig", 0]
	]
] spawn BIS_fnc_establishingShot;
waitUntil { !isNil { BIS_missionStarted } };

//Volumetric fog
//0 setFog [0, 0.275, 25];
0 setFog [0, 0.2, 35];

//Screen starts black and no sound/music
titleText ["", "BLACK FADED", 10];
0 fadeSound 0;
0 fadeMusic 0;
enableRadio false;
enableEnvironment false;
clearRadio;

//Play music and fade in screen, music and sound
[] spawn {
	//Play some music
	if !([] call BIS_fnc_isCampaign) then {
		playMusic "Track09_Night_percussions";
	};
	
	sleep 5;
	titleText ["", "BLACK IN", 5];
	5 fadeSound 0.4;
	5 fadeMusic 0.18;
	enableRadio true;
	enableEnvironment true;
	waitUntil { !isNil { BIS_playerHasLanded } };
	0 fadeSound 1;
	10 fadeMusic 0;
};

//Player stuff
removeAllWeapons player;
removeHeadgear player;
//removeVest player;
player addBackpack "B_AssaultPack_sgg";
clearAllItemsFromBackpack player;

unitBackpack player addMagazineCargo ["flay_1rnd_broadheadarrow", 15];
unitBackpack player addMagazineCargo ["DemoCharge_Remote_Mag", 3];
unitBackpack player addMagazineCargo ["HandGrenade", 3];
unitBackpack player addMagazineCargo ["SmokeShellBlue", 4];

player addWeapon "Binocular";
player addWeapon "flay_compoundbow";

player selectWeapon primaryWeapon player;
player addPrimaryWeaponItem "flay_acc_quiver_7he";
player addPrimaryWeaponItem "optic_aco";
player unassignItem "NVGoggles";
player removeItem "NVGoggles";

group player setGroupId ["Gemini"];


