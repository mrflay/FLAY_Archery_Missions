case "FLAY_Wave1" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				"Eliminate the first wave of enemy infantry.",
				"Eliminate first wave",
				"Wave 1"
			],
			_this,
			false
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "FLAY_Wave2" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				"Eliminate the second wave of enemy infantry.",
				"Eliminate second wave",
				"Wave 2"
			],
			_this,
			false
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "FLAY_Wave3" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				"Eliminate the third wave of enemy infantry.",
				"Eliminate third wave",
				"Wave 3"
			],
			_this,
			false
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

