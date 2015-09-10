if(isServer) then {

    private			["_complete","_crate","_mission","_position","_num_guns","_num_tools","_num_items","_rndnum","_rndgro","_crate_type","_baserunover"];

	_position		= [30] call find_position;
	_mission		= [_position,"Easy","Ural Attack","MainHero",true] call mission_init;
	
	diag_log 		format["WAI: [Mission:[Hero] Ural Attack]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_medium call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0) - 20,(_position select 1) - 20,0], [], 0, "CAN_COLLIDE"];

	//Base
	diag_log 		format["WAI: [Mission:[Hero] Ural Attack]: Spawning Buildings"];
	_baserunover 	= createVehicle ["UralWreck",[(_position select 0),(_position select 1),0],[],15,"FORM"];

	//Troops
	_rndnum 	= 1 + round (random 4);
	_rndgro 	= 1 + round (random 3);

	for "_i" from 0 to _rndgro do {
		[[_position select 0,_position select 1,0],_rndnum,"Easy","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	};
	
	//Condition
	_complete = [
		[_mission,_crate],	// mission number and crate
		["kill"], 			// ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_baserunover], 		// cleanup objects
		"<t align='left' color='#5882FA' shadow='2' size='1.85'>Hero Mission</t><br/><br/>
		<t align='left' color='#FFBF00' shadow='2' size='1.75'>Ural Attack</t><br/><br/><t align='left' color='#ffffff'>Bandits have destroyed a Ural with supplies and are securing the cargo! Check your map for the location!</t><br/>
		<br/><t align='left' color='#61B329' shadow='2' size='1.0'>Difficulty: Easy</t><br/><br/>",	// mission announcement
		"<t align='left' color='#FFBF00' shadow='2' size='1.75'>Ural Attack</t><br/><br/><t align='left' color='#ffffff'>The supplies have been secured by survivors.</t>",																		// mission success
		"<t align='left' color='#FFBF00' shadow='2' size='1.75'>Ural Attack</t><br/><br/><t align='left' color='#ffffff'>Survivors did not secure the supplies in time.</t>"																// mission fail
	] call mission_winorfail;	

	if(_complete) then {
		[_crate,4,8,36,2] call dynamic_crate;
	};

	diag_log format["WAI: [Mission:[Hero] Ural Attack]: Ended at %1",_position];
	
	h_missionrunning = false;
};