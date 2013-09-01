case "FLAY_LocateWeapon" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				"Locate the weapon stash.",
				"Locate weapon stash",
				"Stash"
			],
			_this,
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "FLAY_DestroyHelicopter" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				"Destroy the enemy attack helicopter.",
				"Destroy enemy helicopter",
				"Goliath"
			],
			_this,
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};
