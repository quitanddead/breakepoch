if(isServer) then {

	private ["_max_ai","_timeout_time","_currenttime","_starttime","_msglose","_msgwin","_msgstart","_objectives","_crate","_marker","_in_range","_objectivetarget","_position","_type","_complete","_timeout","_mission","_killpercent","_delete_mines","_cleanunits","_clearmission","_baseclean"];

	_mission	= (_this select 0) select 0;
	_crate		= (_this select 0) select 1;
	_type		= (_this select 1) select 0;
	_baseclean	= _this select 2;
	_msgstart	= _this select 3;
	_msgwin		= _this select 4;
	_msglose	= _this select 5;
	
	_position				= position _crate;
	_timeout 				= false;
	_complete				= false;
	_starttime 				= time;
	_timeout_time			= ((wai_mission_timeout select 0) + random((wai_mission_timeout select 1) - (wai_mission_timeout select 0)));
	_max_ai					= (wai_mission_data select _mission) select 0;
	_killpercent = _max_ai - (_max_ai * (wai_kill_percent / 100));

	_hint = parseText format[_msgstart];
	customRemoteMessage = ['hint', _hint];
	publicVariable "customRemoteMessage";
	
	clearWeaponCargoGlobal _crate;
	clearMagazineCargoGlobal _crate;

	_crate setVariable ["ObjectID","1",true];
	_crate setVariable ["permaLoot",true];
	_crate allowDamage false;

	while {!_timeout && !_complete} do {

		sleep 1;
		_currenttime = time;
		{
			if((isPlayer _x) && (_x distance _position <= wai_timeout_distance)) then {
				_starttime = time;
			};
			
		} count playableUnits;

		if (_currenttime - _starttime >= _timeout_time) then {
			_timeout = true;
		};
		
		call {

			if (_type == "crate") exitWith {

				if(wai_kill_percent == 0) then {

					{
						if((isPlayer _x) && (_x distance _position <= 20)) then {
							_complete = true
						};
					} count playableUnits;

				} else {

					if(((wai_mission_data select _mission) select 0) <= _killpercent) then {
						{
							if((isPlayer _x) && (_x distance _position <= 20)) then {
								_complete = true
							};
						} count playableUnits;
					};

				};

			};

			if (_type == "kill") exitWith {
				if(((wai_mission_data select _mission) select 0) == 0) then {
					_complete = true
				};
			};

			if (_type == "assassinate") exitWith {
				_objectivetarget = (_this select 1) select 1;
				{
					_complete = true;
					if (alive _x) exitWith {_complete = false;};
				} count units _objectivetarget;
			};
		};
	};

	if (_complete) then {

//		if (typeOf(_crate) in (crates_large + crates_medium + crates_small)) then {
		if(wai_crates_smoke && sunOrMoon == 1) then {
			_marker = "smokeShellPurple" createVehicle getPosATL _crate;
			_marker setPosATL (getPosATL _crate);
			_marker attachTo [_crate,[0,0,0]];
		};

		if (wai_crates_flares && sunOrMoon != 1) then {
			_marker = "RoadFlare" createVehicle getPosATL _crate;
			_marker setPosATL (getPosATL _crate);
			_marker attachTo [_crate, [0,0,0]];
			
			_in_range = _crate nearEntities ["CAManBase",1250];
			
			{
				if(isPlayer _x && _x != player) then {
					PVDZE_send = [_x,"RoadFlare",[_marker,0]];
					publicVariableServer "PVDZE_send";
				};
			} count _in_range;

		};

//		};
		_delete_mines = ((wai_mission_data select _mission) select 2);

		if(count _delete_mines > 0) then {
		
			{
				if(typeName _x == "ARRAY") then {
				
					{
						deleteVehicle _x;
					} count _x;
				
				} else {

					deleteVehicle _x;
					
				};
				
			} count _delete_mines;
			
		};
		
		wai_mission_data set [_mission, -1];
		
		_hint = parseText format[_msgwin];
		customRemoteMessage = ['hint', _hint];
		publicVariable "customRemoteMessage";

		if (wai_clean_mission) then {

			[_position,_baseclean] spawn {
				private ["_pos","_clean","_finish_time","_cleaned","_playernear","_currenttime"];
				_pos = _this select 0;
				_clean = _this select 1;
				_finish_time = time;
				_cleaned = false;
				while {!_cleaned} do {

					_playernear = false;

					{
						if ((isPlayer _x) && (_x distance _pos < 400)) exitWith { _playernear = true };
					} count playableUnits;	

					_currenttime = time;

					if ((_currenttime - _finish_time >= wai_clean_mission_time) && !_playernear) then {

						{
							if(typeName _x == "ARRAY") then {
							
								{
									if ((_x getVariable ["ObjectID", nil]) == nil) then {
										deleteVehicle _x;
									};
								} count _x;
							
							} else {
								if ((_x getVariable ["ObjectID", nil]) == nil) then {
									deleteVehicle _x;
								};
							};
							
						} forEach _clean;

						_cleaned = true;

					};
					
					sleep 1;
				};
			};
		};
	};
	
	if (_timeout) then {

		{
		
			if (_x getVariable ["mission", nil] == _mission) then {
			
				if (alive _x) then {

					_cleanunits = _x getVariable ["missionclean",nil];
		
					if (!isNil "_cleanunits") then {
				
						call {
							if(_cleanunits == "ground") 	exitWith { ai_ground_units = (ai_ground_units -1); };
							if(_cleanunits == "air") 		exitWith { ai_air_units = (ai_air_units -1); };
							if(_cleanunits == "vehicle") 	exitWith { ai_vehicle_units = (ai_vehicle_units -1); };
							if(_cleanunits == "static") 	exitWith { ai_emplacement_units = (ai_emplacement_units -1); };
						};
					};
				};
				
				deleteVehicle _x;
			};

		} count allUnits + vehicles + allDead;
		
		{
			if(typeName _x == "ARRAY") then {
			
				{
					deleteVehicle _x;
				} count _x;
			
			} else {
			
				deleteVehicle _x;
			};
			
		} forEach _baseclean + ((wai_mission_data select _mission) select 2) + [_crate];

		wai_mission_data set [_mission, -1];
		
		_hint = parseText format[_msglose];
		customRemoteMessage = ['hint', _hint];
		publicVariable "customRemoteMessage";
	};

	_complete

};
