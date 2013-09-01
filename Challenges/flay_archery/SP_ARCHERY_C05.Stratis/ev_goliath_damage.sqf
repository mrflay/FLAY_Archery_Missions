_unit = _this select 0;
_selection = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_ammo = _this select 4;

if (_selection == "" and _ammo == "G_ExplosiveArrow") then {
	_damage = 0.5 max _damage;
};

_damage;