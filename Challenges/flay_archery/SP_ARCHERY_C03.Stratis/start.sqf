FLAY_UnitSpawnMarkers = [
	"spawn1","spawn2","spawn3",
	"spawn4","spawn5","spawn6",
	"spawn7","spawn8"
];

FLAY_HeliSpawnMarkers = [
	"helispawn1","helispawn2","helispawn3"
];

FLAY_AmmoSpawnMarkers = [
	"ammospawn1","ammospawn2","ammospawn3", "ammospawn4"
];

FLAY_EH_UnitKilled = {
	
	private ["_unit", "_range", "_ammo", "_baseScore", "_rangeBonus", "_totalScore", "_kills", "_task"];
	
	_unit = _this select 0;
	_range = _unit distance player;
	_ammo = "";
	
	_baseScore = 100;
	_rangeBonus = 1 max (10 + round (_range / 10));
	_totalScore = _totalScore + _baseScore + _rangeBonus;
	
	player addRating _totalScore;
	player addScore _totalScore;
	
	_kills = missionNamespace getVariable ["kills", []];
	_kills = _kills + [[typeOf _unit, _range, _ammo]];
	missionNamespace setVariable ["kills", _kills];
	
	_task = currentTask player;
	_task setTaskState "Succeeded";
	
	removeAllWeapons _unit;
	_unit spawn {
		sleep 30;
		while { _this distance player < 5 } do { sleep 5; };
		deleteVehicle _this;
	};
};

FLAY_fnc_SpawnSoldier = {
	
	private ["_group", "_unit", "_unitType", "_unitClass", "_weapons", "_magazines", "_headgear", "_uniform", "_vest", "_waypoint"];
	
	_group = _this select 0;
	_unitType = _this select 1;
	_unitClass = getText (missionConfigFile >> "CfgWaves" >> "Units" >> _unitType >> "type");
	
	_unit = _group createUnit [_unitClass, [0,0,0], FLAY_UnitSpawnMarkers, 5, "NONE"];		
	
	_weapons = getArray (missionConfigFile >> "CfgWaves" >> "Units" >> _unitType >> "weapons");
	_magazines = getArray (missionConfigFile >> "CfgWaves" >> "Units" >> _unitType >> "magazines");
	
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

	_unit addEventHandler ["killed", "_this call FLAY_EH_UnitKilled"];

	_waypoint = _group addWaypoint [position player, 1];
	_waypoint setWaypointBehaviour "AWARE";
	_waypoint setWaypointCombatMode "RED";
	_group setCurrentWaypoint _waypoint;
	
	_unit;
};

FLAY_fnc_SpawnHeli = {
	
	private ["_group", "_unit", "_unitType", "_unitClass", "_waypoint"];
	
	_group = _this select 0;
	_unitType = _this select 1;
	_unitClass = getText (missionConfigFile >> "CfgWaves" >> "Units" >> _unitType >> "type");
	_unit = createVehicle [_unitClass, [0,0,0], FLAY_HeliSpawnMarkers, 50, "FLY"];
	_unit setDamage 0.4;
	[_unit] joinSilent _group;
	_pilot = _group createUnit ["O_helipilot_F", [0,0,0], FLAY_HeliSpawnMarkers, 0, "NONE"];
	_gunner = _group createUnit ["O_helipilot_F", [0,0,0], FLAY_HeliSpawnMarkers, 0, "NONE"];
	_pilot moveInDriver _unit;
	_gunner moveInGunner _unit;
	
	_unit addEventHandler ["killed", "_this call FLAY_EH_UnitKilled"];

	_waypoint = _group addWaypoint [position player, 1];
	_waypoint setWaypointBehaviour "CARELESS";
	_waypoint setWaypointCombatMode "BLUE";
	_group setCombatMode "BLUE";
	_group setBehaviour "CARELESS";	
	//_waypoint setWaypointType "SAD";
	_group setCurrentWaypoint _waypoint;
	
	_unit;
};

FLAY_fnc_SpawnUnit = {
	private ["_group", "_unitType", "_unit"];
	_group = _this select 0;
	_unitType = _this select 1;
	_unit = objNull;
	if (_unitType == "heli") then {
		_unit = [_group, _unitType] call FLAY_fnc_SpawnHeli;
	} else {
		_unit = [_group, _unitType] call FLAY_fnc_SpawnSoldier;
	};
	_unit;
};

FLAY_fnc_SpawnAmmo = {
	private ["_ammo", "_waveIndex", "_waves", "_waveName", "_magazines", "_items"];
	
	// delete any existing ammo box
	{ deleteVehicle _x; } forEach ((position player) nearObjects ["box_nato_ammo_f", 500]);
	
	_ammo = createVehicle ["box_nato_ammo_f", [0,0,0], FLAY_AmmoSpawnMarkers, 2, "NONE"];
	
	clearWeaponCargo _ammo;
	clearMagazineCargo _ammo;
	clearItemCargo _ammo;
	clearBackpackCargo _ammo;
	
	_waveIndex = _this select 0;
	_waves = getArray (missionConfigFile >> "CfgWaves" >> "waves");
	_waveName = _waves select _waveIndex;	
	_magazines = getArray (missionConfigFile >> "CfgWaves" >> _waveName >> "magazines");	
	_items = getArray (missionConfigFile >> "CfgWaves" >> _waveName >> "items");	
	{ _ammo addMagazineCargo [_x, 1]; } forEach _magazines;
	{ _ammo addItemCargo [_x, 1]; } forEach _items;

	(group player) addWaypoint [position _ammo, 2];
};

FLAY_fnc_SpawnWave = {
	private ["_group", "_waveIndex", "_waves", "_waveName", "_units"];
	_group = _this select 0;
	_waveIndex = _this select 1;
	_waves = getArray (missionConfigFile >> "CfgWaves" >> "waves");
	_waveName = _waves select _waveIndex;	
	_units = getArray (missionConfigFile >> "CfgWaves" >> _waveName >> "units");
	{
		[_group, _x] call FLAY_fnc_SpawnUnit;
	} forEach _units;
};

[] execVM "score.sqf";

[] spawn {
	
	private ["_task", "_subtask", "_timeout", "_bluforCenter", "_blueforGroup", "_opforCenter", "_opforGroup", "_opforWaypoint"];
	private ["_isGroupAlive", "_wave", "_waveIndex", "_waveName"];
	
	_task = objNull;
	_waveIndex = 0;
	_timeout = 0;
	
	waitUntil { alive player };

	_bluforCenter = createCenter west;
	_bluforGroup = createGroup west;
	[player] joinSilent _bluforGroup;

	player addEventHandler ["killed", "_this spawn { (currentTask player) setTaskState 'failed'; sleep 3; failMission 'EndFailure'; }"];
	//player addEventHandler ["killed", "_this spawn { (currentTask player) setTaskState 'failed'; ['EndFailure',false,true] call BIS_fnc_endMission; }"];
	
	_opforCenter = createCenter east;
	_opforGroup = createGroup east;
	_opforWaypoint = _opforGroup addWaypoint [position player, 5];
	_opforWaypoint setWaypointBehaviour "AWARE";
	_opforWaypoint setWaypointCombatMode "RED";
	_opforGroup setCombatMode "RED";
	_opforGroup setBehaviour "AWARE";
		
	while {alive player} do {
		_isGroupAlive = false;
		{ _isGroupAlive = (_isGroupAlive or (alive _x)); } forEach (units _opforGroup);
		if (_isGroupAlive) then {
			if (time > _timeout) then {
				_timeout = time + 15;
				_opforWaypoint = _opforGroup addWaypoint [position player, 2];
				//_opforWaypoint setWaypointBehaviour "CARELESS";
				//_opforWaypoint setWaypointCombatMode "RED";
				//_opforWaypoint setWaypointType "SAD";
				//_opforGroup setCurrentWaypoint _opforWaypoint;
				_opforGroup setCombatMode "RED";
				//_opforGroup setBehaviour "CARELESS";
			};
		} else {
			_timeout = time + 15;
			_waves = getArray (missionConfigFile >> "CfgWaves" >> "waves");
			_isEnd = _waveIndex >= (count _waves);
			
			if (_isEnd) then {
				sleep 15;
				//titleCut ["", "BLACK OUT", 2];
				//sleep 3;
				//endMission "endsuccess";
				['EndSuccess', true, true] call BIS_fnc_endMission;
			} else {
				[_waveIndex] call FLAY_fnc_SpawnAmmo;
				sleep 3;
				hint "Next wave in 10 seconds";
				
				_waveName = _waves select _waveIndex;	
				_description = getText (missionConfigFile >> "CfgWaves" >> _waveName >> "description");
			
				_task = player createSimpleTask [format ["Survive Wave %1", _waveIndex]];
				_task setSimpleTaskDescription [_description, format ["Survive Wave %1", (_waveIndex + 1)], ""];
				_task setTaskState "Created";
				
				sleep 10;
				
				_opforGroup = createGroup east; // create new group to clear knowsAbout state?
				[_opforGroup, _waveIndex] call FLAY_fnc_SpawnWave;
				_task setTaskState "Assigned";
				player setCurrentTask _task;
				
				_waveIndex = _waveIndex + 1;
			};
		};
		sleep 1;
	};
};