/* fn_hintscore.sqf */
disableserialization;

_score = [_this,0,0,[0]] call bis_fnc_param;
_rscWaveHUD = (uiNamespace getVariable "FLAY_RscWaveHUD");
(_rscWaveHUD displayCtrl 1001) ctrlSetText (str _score);
(_rscWaveHUD displayCtrl 1001) ctrlCommit 0;