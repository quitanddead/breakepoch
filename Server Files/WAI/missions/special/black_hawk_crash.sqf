if(isServer) then {

	private 		["_complete","_crate_type","_mission","_position","_crate","_baserunover"];

	_position		= [30] call find_position;
	_mission		= [_position,"Medium","Black Hawk Crash","Special",true] call mission_init;	
	
	diag_log 		format["WAI: [Mission:[Neutral] Black Hawk Crash]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_medium call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0),(_position select 1),0],[],0,"CAN_COLLIDE"];

	//Base
	_baserunover 	= createVehicle ["UH60_ARMY_Wreck_burned_DZ",[((_position select 0) + 5), ((_position select 1) + 5), 0],[],10,"FORM"];
	_baserunover 	setVectorUp surfaceNormal position _baserunover;

	//Troops
	[[_position select 0,_position select 1,0],3,"Medium","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],3,"Medium","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],3,"Medium","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;

	//Static Guns
	[[
		[(_position select 0) + 20, (_position select 1) + 20, 0],
		[(_position select 0) - 20, (_position select 1) - 20, 0]
	],"M2StaticMG","Easy","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static;
	
	//Condition
	_complete = [
		[_mission,_crate],	// mission number and crate
		["crate"], 			// ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_baserunover], 	// cleanup objects
		"<t align='left' color='#ffea00' shadow='2' size='1.85'>Neutral Mission</t><br/><br/>
		<t align='left' color='#FFBF00' shadow='2' size='1.75'>Blackhawk Down!</t><br/><br/><t align='left' color='#ffffff'>A Black Hawk carrying supplies has crashed and bandits are securing the site! Check your map for the location!</t><br/>
		<br/><t align='left' color='#D60000' shadow='2' size='1.0'>Difficulty: Hard</t><br/><br/>",	// mission announcement
		"<t align='left' color='#FFBF00' shadow='2' size='1.75'>Blackhawk Down!</t><br/><br/><t align='left' color='#ffffff'>Survivors have secured the crashed Black Hawk!</t>",																		// mission success
		"<t align='left' color='#FFBF00' shadow='2' size='1.75'>Blackhawk Down!</t><br/><br/><t align='left' color='#ffffff'>Survivors did not secure the crashed Black Hawk in time!</t>"																// mission fail
	] call mission_winorfail;	

	diag_log format["WAI: [Mission:[Neutral] Black Hawk Crash]: Ended at %1",_position];

	if(_complete) then {
		[_crate,5,5,10,2] call dynamic_crate;
	};

	h_missionrunning = false;
};