/*
   by: http://infiSTAR.de || http://DayzAntiHack.com
   *updated on 22.09.2014
*/
USE_CANBUILD = true;
USE_TraderCity = true;
USE_POSITIONS = true;
USE_AI_REMOVER = true;
USE_AntiSteal = true;
USE_SPEEDLIMIT = true;
        SPEEDLIMIT = 30;
USE_SIGNS = false;
LOG_EnterLeave = true;
_infiSZ =
[
	[[8259.3721,15472.314],100,true],
	[[18564.844,2515.7451],100,true],
	[[13152.893,6381.4751],80,true],
	[[18688.715,9442.4629],100,true],
	[[12811.504,5284.1743],75,true],
	[[11065.948,11801.703],75,true],
	[[2036.6864,7815.2349],65,true],
	[[16840.762,5261.2378],65,true],
	[[14826.737,16414.869],80,true],
	[[5139.877,4864.2231],75,true]
];
if (isServer) exitWith
{
        if (USE_SIGNS) then
        {
                {
                        _center = _x select 0;
                        _radius = _x select 1;
                        _lSign = _x select 2;
                        if (_lSign) then
                        {
                                for '_i' from 0 to 360 step (270 / _radius)*2 do
                                {
                                        _location = [(_center select 0) + ((cos _i) * _radius), (_center select 1) + ((sin _i) * _radius),0];
                                        _dir = ((_center select 0) - (_location select 0)) atan2 ((_center select 1) - (_location select 1));
                                        _object = createVehicle ['Sign_sphere100cm_EP1', _location, [], 0, 'CAN_COLLIDE'];
                                        //      _object = createVehicle ['SignM_FARP_Winchester_EP1', _location, [], 0, 'CAN_COLLIDE'];
                                        //      _object setVehicleInit 'this setObjectTexture [0,''Addons\SafeZones\sign.paa''];';
                                        _object setDir _dir;
                                };
                        };
                } forEach _infiSZ;
        };
};
waitUntil {((!isNil 'dayz_animalCheck') || (!isNil 'dayz_medicalH') || (!isNil 'dayz_slowCheck') || (!isNil 'dayz_gui'))};
if (isNil 'inSafeZone') then { inSafeZone = false; } else { if (typename inSafeZone != 'BOOL') then { inSafeZone = false; }; };
[_infiSZ] spawn {
        _infiSZ = _this select 0;
        _startSafeZone =
        {
                if (isNil 'outNow') then
                {
                        _msg = 'You entered a Safe Zone!';
                        hint _msg;
                        taskHint [_msg, [0,1,0,1], 'taskDone'];
                        inNow = nil;
                        outNow = true;
                       
                        if (LOG_EnterLeave) then
                        {
                                PVDZE_send = [player,'SafeZoneState',[1]];
                                publicVariableServer 'PVDZE_send';
                        };
                };
                player_fired2 = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_fired.sqf';
                player_fired = {
                        _this call player_fired2;
                        deleteVehicle (nearestObject [_this select 0,_this select 4]);
                        cutText ['You can not fire in a SafeZone!','WHITE IN'];
                };
                fnc_usec_damageHandler = {};
                player removeAllEventHandlers 'handleDamage';
                player addEventHandler ['handleDamage', {false}];
                player allowDamage false;
                _veh = vehicle player;
                if (player != _veh) then
                {
                        _szs = _veh getVariable ['inSafeZone',0];
                        if (_szs == 0) then
                        {
                                _veh removeAllEventHandlers 'Fired';
                                _veh addEventHandler ['Fired', {_this call player_fired;}];
                                {
                                        _x removeAllEventHandlers 'Fired';
                                        _x addEventHandler ['Fired', {_this call player_fired;}];
                                } forEach (crew _veh);
                                _veh setVariable ['inSafeZone', 1, true];
                                _veh removeAllEventHandlers 'HandleDamage';
                                _veh addEventHandler ['HandleDamage', {false}];
                                _veh allowDamage false;
                        };
                };
                _notInSafeZone =
                [
                        'MAAWS','RPG7V','M136','RPG18','STINGER',
                        'MeleeHatchet_DZE','MeleeHatchet','MeleeCrowbar','MeleeMachete','MeleeFishingPole','MeleeSledge',
                        'MeleeBaseBallBatNails','MeleeBaseBallBatBarbed','MeleeBaseBallBat'
                ];
                _cwep = currentWeapon player;
                if (_cwep in _notInSafeZone) then
                {
                        _swep = '';
                        {
                                if ((getNumber (configFile >> 'CfgWeapons' >> _x >> 'Type')) == 2) exitWith
                                {
                                        _swep = _x;
                                };
                        } forEach (weapons player);
                        if (_swep == '') then
                        {
                                player playActionNow 'PutDown';
                                _iPos = getPosATL player;
                                _radius = 1;
                                _removed = ([player,_cwep,1] call BIS_fnc_invRemove);
                                if (_removed == 1) then
                                {
                                        _item = createVehicle ['WeaponHolder', _iPos, [], _radius, 'CAN_COLLIDE'];
                                        _item addWeaponCargoGlobal [_cwep,1];
                                };
                        }
                        else
                        {
                                player selectweapon _swep;
                        };
                };
        };
        _endSafeZone =
        {
                if (isNil 'inNow') then
                {
                        if (str fnc_usec_damageHandler == '{}') then
                        {
                                _msg = 'You left the Safe Zone!';
                                hint _msg;
                                taskHint [_msg, [1,0,0.1,1], 'taskFailed'];
                        };
                        inNow = true;
                        outNow = nil;
                       
                        if (LOG_EnterLeave) then
                        {
                                PVDZE_send = [player,'SafeZoneState',[0]];
                                publicVariableServer 'PVDZE_send';
                        };
                };
                player_fired = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_fired.sqf';
                player_zombieCheck = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_zombieCheck.sqf';
                fnc_usec_unconscious = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\fn_unconscious.sqf';
                object_monitorGear = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\object_monitorGear.sqf';
               
                _veh = vehicle player;
                if (player != _veh) then
                {
                        _szs = _veh getVariable ['inSafeZone',0];
                        if (_szs == 1) then
                        {
                                _veh setVariable ['inSafeZone', 0, true];
                                _veh removeAllEventHandlers 'HandleDamage';
                                _veh addeventhandler ['HandleDamage',{ _this call vehicle_handleDamage } ];
                                _veh allowDamage true;
                        };
                };
               
                _end = false;
                if (isNil 'gmadmin') then
                {
                        _end = true;
                }
                else
                {
                        if (gmadmin == 0) then
                        {
                                _end = true;
                        };
                };
                if (_end) then
                {
                        player allowDamage true;
                        fnc_usec_damageHandler = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\fn_damageHandler.sqf';
                        player removeAllEventHandlers 'HandleDamage';
                        player addeventhandler ['HandleDamage',{_this call fnc_usec_damageHandler;} ];
                };
        };
        while {1 == 1} do
        {
                if (isNil 'inSafeZone') then { inSafeZone = false; } else { if (typename inSafeZone != 'BOOL') then { inSafeZone = false; }; };
                _state = false;
                if (isNil 'USE_POSITIONS') then { USE_POSITIONS = false; } else { if (typename USE_POSITIONS != 'BOOL') then { USE_POSITIONS = false; }; };
                if (USE_POSITIONS) then
                {
                        {
                                _z = _x select 0;
                                _r = _x select 1;
                                if ((vehicle player) distance _z < _r) then {_state = true;};
                        } forEach _infiSZ;
                };
                if (isNil 'USE_CANBUILD') then { USE_CANBUILD = true; } else { if (typename USE_CANBUILD != 'BOOL') then { USE_CANBUILD = true; }; };
                if (USE_CANBUILD) then
                {
                        if (isNil 'canbuild') then { canbuild = true; } else { if (typename canbuild != 'BOOL') then { canbuild = true; }; };
                        if (!canbuild) then {_state = true;};
                };
                if (isNil 'USE_TraderCity') then { USE_TraderCity = true; } else { if (typename USE_TraderCity != 'BOOL') then { USE_TraderCity = true; }; };
                if (USE_TraderCity) then
                {
                        if (isNil 'isInTraderCity') then { isInTraderCity = false; } else { if (typename isInTraderCity != 'BOOL') then { isInTraderCity = false; }; };
                        if (isInTraderCity) then {_state = true;};
                };
                if (_state) then
                {
                        inSafeZone = true;
                        call _startSafeZone;
                        {
                                if (!isNull _x) then
                                {
                                        if !(isPlayer _x) then
                                        {
                                                deletevehicle _x;
                                        };
                                };
                        } forEach ((vehicle player) nearEntities ['zZombie_Base',15]);
                       
                        if (isNil 'USE_AI_REMOVER') then { USE_AI_REMOVER = false; } else { if (typename USE_AI_REMOVER != 'BOOL') then { USE_AI_REMOVER = false; }; };
                        if (USE_AI_REMOVER) then
                        {
                                {
                                        if ((!isNull group _x) && (getPlayerUID _x == '')) then
                                        {
                                                deleteVehicle _x;
                                        };
                                } forEach (player nearEntities ['Man',100]);
                        };
                }
                else
                {
                        inSafeZone = false;
                };
                uiSleep 2;
                if (!inSafeZone) then
                {
                        call _endSafeZone;
                };
        };
};
if ((USE_AntiSteal) || (USE_SPEEDLIMIT)) then
{
        [] spawn {
                _USE_AntiSteal = USE_AntiSteal;
                _USE_SPEEDLIMIT = USE_SPEEDLIMIT;
                _speedlimit = SPEEDLIMIT;
                while {1 == 1} do
                {
                        if (inSafezone) then
                        {
                                if (_USE_AntiSteal) then
                                {
                                        _cnt = {isPlayer _x && _x != player} count (player nearEntities [['CAManBase'], 3]);
                                        if ((_cnt > 0) && (!isNull (findDisplay 106))) then
                                        {
                                                (findDisplay 106) closedisplay 0;
                                                closeDialog 0;
                                                _log = format['%1 You are not allowed to open Gear while near another player!',name player];
                                                cutText [_log,'PLAIN'];
                                                hint _log;
                                        };
                                };
                                if (_USE_SPEEDLIMIT) then
                                {
                                        _obj = vehicle player;
                                        if !(_obj isKindOf 'Plane') then
                                        {
                                                _speed = abs speed _obj;
                                                if ((_obj != player) && (_speed > _speedlimit)) then
                                                {
                                                        _vel = velocity _obj;
                                                        _x = 0.8;
                                                        if (_speed > 50) then {_x = 0.1;};
                                                        _velNew = [(_vel select 0) * _x, (_vel select 1) * _x,(_vel select 2) * _x];
                                                        _obj SetVelocity _velNew;
                                                };
                                        };
                                };
                        }
                        else
                        {
                                uiSleep 2;
                        };
                        uiSleep 0.1;
                };
        };
};