/* fn_hintwave.sqf */
disableserialization;

_text = [_this,0,"",[""]] call bis_fnc_param;
_rscWaveHUD = (uiNamespace getVariable "FLAY_RscWaveHUD");
(_rscWaveHUD displayCtrl 1000) ctrlSetText (_text);
(_rscWaveHUD displayCtrl 1000) ctrlCommit 0;