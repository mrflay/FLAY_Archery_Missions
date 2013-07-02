case "FLAY_Infiltrate" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				"Reach the infiltration point on Pythos island.",
				"Infiltrate Pythos island",
				"Infiltrate"
			],
			_this,
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "FLAY_Rescue" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				"Locate and free the captured helicopter crew.",
				"Rescue helicopter crew",
				"Crash site"
			],
			_this,
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "FLAY_Extract" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Showcase_Night2_BIS_Extraction_desc",
				localize "STR_A3_Showcase_Night2_BIS_Extraction_title",
				"FLAY_marker"
			],
			_this,
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "FLAY_Rendezvous" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				localize "STR_A3_Showcase_Night2_BIS_Extraction_desc",
				localize "STR_A3_Showcase_Night2_BIS_Extraction_title",
				localize "STR_A3_Showcase_Night2_BIS_Extraction_marker"
			],
			_this,
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};