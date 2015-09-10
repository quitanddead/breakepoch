if(isServer) then {

	private 		["_complete","_crate_type","_mission","_position","_crate","_playerPresent","_rndnum","_rndgro","_num_guns","_num_tools","_num_items"];

	_position		= [30] call find_position;
	_mission		= [_position,"Medium","Weapon Cache","MainHero",true] call mission_init;
	
	diag_log 		format["WAI: [Mission:[Hero] Weapon Cache]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_small call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0),(_position select 1),0],[],0,"CAN_COLLIDE"];
	
	

	//Troops
	_rndnum 	= (1 + round(random 7));
	_rndgro 	= (1 + round(random 3));
	for "_i" from 0 to _rndgro do {
		[[_position select 0,_position select 1,0],_rndnum,"Easy","Random",3,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	};

	//Static Guns
	[[
		[(_position select 0) + 10, (_position select 1) + 10, 0],
		[(_position select 0) - 10, (_position select 1) - 10, 0]
	],"M2StaticMG","Easy","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static;

	//Condition
	_complete = [
		[_mission,_crate],	// mission number and crate
		["crate"],			// ["crate"], or ["kill",wai_kill_percent], or ["assassinate", _unitGroup],
		[],					// cleanup objects
		"<t align='left' color='#5882FA' shadow='2' size='1.85'>Hero Mission</t><br/><br/>
		<t align='left' color='#FFBF00' shadow='2' size='1.75'>Weapon Cache</t><br/><br/><t align='left' color='#ffffff'>Bandits have obtained a weapon crate! Check your map for the location!</t><br/>
		<br/><t align='left' color='#61B329' shadow='2' size='1.0'>Difficulty: Easy</t><br/><br/>",	// mission announcement
		"<t align='left' color='#FFBF00' shadow='2' size='1.75'>Weapon Cache</t><br/><br/><t align='left' color='#ffffff'>Survivors have secured the weapon cache.</t>",																		// mission success
		"<t align='left' color='#FFBF00' shadow='2' size='1.75'>Weapon Cache</t><br/><br/><t align='left' color='#ffffff'>Survivors did not secure the weapon cache in time.</t>"																// mission fail
	] call mission_winorfail;	

	if(_complete) then {
		[_crate,10,4,0,2] call dynamic_crate;
	};

	diag_log format["WAI: [Mission:[Hero] Weapon Cache]: Ended at %1",_position];

	h_missionrunning = false;
};