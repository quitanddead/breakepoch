private ["_vehicle","_status","_sounddist"];
_vehicle = _this select 0;
_status = _this select 1;
_sounddist = 20;

if (local _vehicle) then {
	if(_status) then {
		_vehicle setVehicleLock "LOCKED";
		player action ["lightOn", _vehicle];
		_nul = [objNull, _vehicle, rSAY, "carlock", _sounddist] call RE;
		uisleep 0.5;
		player action ["lightOff", _vehicle];
		_vehicle setVariable ["salvage_disabled",true,true];
	} else {
		_vehicle setVehicleLock "UNLOCKED";
		player action ["lightOn", _vehicle];
		_nul = [objNull, _vehicle, rSAY, "carlock", _sounddist] call RE;
		uisleep 0.5;
		player action ["lightOff", _vehicle];
		_vehicle setVariable ["salvage_disabled",false,true];
	};
};