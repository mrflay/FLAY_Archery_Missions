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
				"Escort the crew to the extraction point.",
				"Extraction",
				"Extraction"
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
				 "Rendezvous with the extraction team in Kamino Bay",
				 "Rendezvous",
				 "Rendezvous"
			],
			_this,
			true
		] call BIS_fnc_taskCreate;
	} else {
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};