if(isServer) then {

	private			["_complete","_crate_type","_mission","_vehname","_vehicle","_position","_vehclass","_crate","_baserunover","_rndnum"];

	_position		= [30] call find_position;
	_mission		= [_position,"Hard","Captured MV22","Special",true] call mission_init;
	
	diag_log 		format["WAI: [Mission:[Neutral] Captured MV22]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_small call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0) - 20,(_position select 1) - 20,0], [], 0, "CAN_COLLIDE"];
	
	//Medical Tent
	_baserunover 	= createVehicle ["USMC_WarfareBFieldhHospital",[(_position select 0) - 40, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover 	setVectorUp surfaceNormal position _baserunover;

	//Troops
	_rndnum = 3 + round (random 3);
	[[_position select 0,_position select 1,0],_rndnum,"Hard","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],_rndnum,"Hard","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],_rndnum,"Random","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],_rndnum,"Random","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	 
	//Static Guns
	[[
		[(_position select 0) + 10, (_position select 1) + 10, 0],
		[(_position select 0) + 10, (_position select 1) - 10, 0]
	],"M2StaticMG","Medium","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static;

	//MV22
	_vehclass 		= "MV22_DZ";
	_vehicle		= [_vehclass,_position] call custom_publish;
	
	if(debug_mode) then {
		diag_log format["WAI: [Hero] captured_mv22 spawned a MV22 at %1", _position];
	};

	//Condition
	_complete = [
		[_mission,_crate],	// mission number and crate
		["crate"], 			// ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_vehicle,_baserunover], 		// cleanup objects
		"<t align='left' color='#ffea00' shadow='2' size='1.85'>Neutral Mission</t><br/><br/>
		<t align='left' color='#FFBF00' shadow='2' size='1.75'>Captured MV22</t><br/><br/><t align='left' color='#ffffff'>Bandits have captured a Red Cross MV-22! An informant has advised there are medical supplies, he has updated the map for the location!</t><br/>
		<br/><t align='left' color='#D60000' shadow='2' size='1.0'>Difficulty: Hard</t><br/><br/>",	// mission announcement
		"<t align='left' color='#FFBF00' shadow='2' size='1.75'>Captured MV22</t><br/><br/><t align='left' color='#ffffff'>Survivors have secured the MV-22.</t>",																		// mission success
		"<t align='left' color='#FFBF00' shadow='2' size='1.75'>Captured MV22</t><br/><br/><t align='left' color='#ffffff'>Survivors did not secure the MV-22 in time.</t>"																// mission fail
	] call mission_winorfail;

	if(_complete) then {
		[_crate,0,0,[80,crate_items_medical],0] call dynamic_crate;
	};

	diag_log format["WAI: [Mission:[Neutral] Captured MV22]: Ended at %1",_position];

	h_missionrunning = false;
};