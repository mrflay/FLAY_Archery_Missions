private ["_x","_group", "_spawned", "_waveIndex", "_spawnMarkers", "_waves", "_waveName", "_units", "_taskID","_taskTitle","_taskDesc","_taskDest"];

_group = _this select 0;
_waveIndex = _this select 1;
_spawnMarkers = _this select 2;
_waves = getArray (missionConfigFile >> "CfgWaves" >> "waves");
//player globalchat format ["waveindex: %1, waves=%2", str _waveIndex, str _waves];

// true if units were spawned
_spawned = false;

if (_waveIndex < (count _waves)) then {
	_spawned = true;
	_waveName = _waves select _waveIndex;	
	_units = getArray (missionConfigFile >> "CfgWaves" >> _waveName >> "units");
	{
		[_group, _x, _spawnMarkers] call FLAY_fnc_SpawnUnit;
	} forEach _units;

	_taskID = format ["FLAY_Wave%1", _wave];
	_taskTitle = getText (missionConfigFile >> "CfgWaves" >> _waveName >> "title");
	_taskDesc = getText (missionConfigFile >> "CfgWaves" >> _waveName >> "desc");
	_taskDest = "";
	//_dest = getText (missionConfigFile >> "CfgWaves" >> _waveName >> "dest");
	[
		player,
		_taskID,
		[
			_taskDesc,
			_taskTitle,
			_taskDest
		],
		objNull,
		true
	] call BIS_fnc_taskCreate;
};

_spawned;