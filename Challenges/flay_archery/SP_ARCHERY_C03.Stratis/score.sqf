disableserialization;

waitUntil { alive player };

18 cutRsc ["FLAY_RscArcheryScore", "plain", 0];
waitUntil {!isNull (uiNamespace getVariable "FLAY_RscArcheryScore")};
_display = (uiNamespace getVariable "FLAY_RscArcheryScore");

while { alive player } do {
	
	sleep 1;

	_totalScore = 0;
	_kills = missionNamespace getVariable ["kills", []];
	_killIcons = "";
	
	{
		_enemyType = _x select 0;
		_enemyRange = _x select 1;
		_playerAmmo = _x select 2;
		
		_baseScore = 100;
		_typeBonus = 1;
		_rangeBonus = 1 max (round (_enemyRange / 10));
		_ammoBonus = 1;
		_totalScore = _totalScore + _baseScore * _typeBonus * _rangeBonus * _ammoBonus;
		
		_iconName = getText (configfile >> "CfgVehicles" >> _enemyType >> "icon");
		_iconFile = getText (configfile >> "CfgVehicleIcons" >> _iconName);
		
		_killIcons = format ["%1 <img size='5' color='#ff0000' image='%2'/>", _killIcons, _iconFile];
		
	} forEach _kills;
	
	//(_display displayCtrl (3022)) ctrlSetText (str _totalScore);
	(_display displayCtrl (3023)) ctrlSetStructuredText (parseText _killIcons);
	(_display displayCtrl (3022)) ctrlSetFont "TahomaB";
	(_display displayCtrl (3022)) ctrlSetFontHeight 0.04;
	(_display displayCtrl (3022)) ctrlSetFade 0;
	(_display displayCtrl (3022)) ctrlCommit 0;

	(_display displayCtrl (3023)) ctrlSetStructuredText (parseText _killIcons);
	(_display displayCtrl (3022)) ctrlSetFontHeight 0.04;
	(_display displayCtrl (3023)) ctrlSetFade 0;
	(_display displayCtrl (3023)) ctrlCommit 0;

};