case "FLAY_Infiltrate" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				"Reach the infiltration point on Pythos island.",
				"Infiltrate",
				"Infiltrate"
			],
			_this,
			false
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
				"Rescue",
				"Crash site"
			],
			_this,
			false
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};

case "FLAY_Destroy" : {
	if (_taskState == "") then {
		[
			player,
			_taskID,
			[
				"Destroy the downed helicopter.",
				"Destroy",
				"Helicopter"
			],
			_this,
			false
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
				"Escort the crew to the extraction point.",
				"Extract",
				"Extraction"
			],
			_this,
			false
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
				 "Rendezvous with the extraction team in Kamino Bay",
				 "Rendezvous",
				 "Rendezvous"
			],
			_this,
			false
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};