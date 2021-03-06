donn_sleep = 0.2;
donn_multi = 2/3;
drn_fnc_DynamicWeather_SetWeatherLocal = {};
0 setOvercast 0;
0 setFog 0.05;

if (!isDedicated) then {
	"cad_pvar_server_date" addPublicVariableEventHandler {(_this select 1) call donn_setdate;};
	donn_setdate = {
		private ["_dateSer","_dateCli","_date_diff"];
		donn_speed = _this select 1;
		0 setOvercast 0;
		_dateSer = dateToNumber (_this select 0);
		_dateCli = dateToNumber date;
		_date_diff = (_dateSer-_dateCli)*12*31*24;
		if (abs _date_diff > 5/60) then {setDate (_this select 0);};
	};
};

[] spawn {
	private ["_time","_timeLen"];
	_time = time;
	waitUntil {!isNil "donn_speed"};
	while {true} do {
		sleep donn_sleep; 
		_timeLen = time - _time;
		_time = _time + _timeLen;
		skipTime ((_timeLen*(donn_speed*donn_multi-1))/3600);
	};
};

if (!isDedicated) then {
	[] spawn {
		for "_x" from 1 to 10 do {
			cad_pvar_send_owner = player;
			publicVariableServer "cad_pvar_send_owner";
			sleep 0.5;
		};
	};
};