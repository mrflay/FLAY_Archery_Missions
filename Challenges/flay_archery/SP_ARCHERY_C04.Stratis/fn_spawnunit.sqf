private ["_group", "_unit", "_unitType", "_unitClass", "_weapons", "_magazines", "_headgear", "_uniform", "_vest", "_waypoint"];

_group = _this select 0;
_unitType = _this select 1;
_spawnMarkers = _this select 2;
_unitClass = getText (missionConfigFile >> "CfgWaves" >> "Units" >> _unitType >> "type");

_unit = _group createUnit [_unitClass, [0,0,0], _spawnMarkers, 5, "NONE"];		

_weapons = getArray (missionConfigFile >> "CfgWaves" >> "Units" >> _unitType >> "weapons");
_magazines = getArray (missionConfigFile >> "CfgWaves" >> "Units" >> _unitType >> "magazines");

if (count _weapons > 0) then {
	removeAllWeapons _unit;
	removeAllItems _unit;
	
	_headgear = headGear _unit;
	_uniform = uniform _unit;
	_vest = vest _unit;

	clearAllItemsFromBackpack _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	_unit addUniform _uniform;
	_unit addVest _vest;			
	_unit addHeadgear _headgear;	

	{ _unit addWeapon _x; } forEach _weapons;
	{ _unit addMagazine _x; } forEach _magazines;

};

FLAY_wave_onUnitKilled = {
	removeAllWeapons (_this select 0);
	_score = missionNamespace getVariable ["flay.wave.score", 0];
	_score = _score + 200; // kill bonus
	missionNamespace setVariable ["flay.wave.score", _score];
	_score call flay_fnc_hintscore;
};

_unit addEventHandler ["killed", "_this call FLAY_wave_onUnitKilled"];

_unit;

