if(isServer) then {

	private			["_complete","_baserunover","_crate_type","_crate","_mission","_position","_num_guns","_num_tools","_num_items","_rndnum","_rndgro"];

	_position		= [30] call find_position;
	_mission		= [_position,"Easy","Ural Attack","MainBandit",true] call mission_init;

	diag_log 		format["WAI: [Mission:[Bandit] Ural Attack]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_medium call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0),(_position select 1),0],[],10,"FORM"];

	//Base
	_baserunover 	= createVehicle ["UralWreck",[(_position select 0),(_position select 1),0],[],14,"FORM"];
	_baserunover 	setVectorUp surfaceNormal position _baserunover;

	//Troops
	_rndnum 	= 1 + round (random 4);
	_rndgro 	= 1 + round (random 3);

	for "_i" from 0 to _rndgro do {
		[[_position select 0,_position select 1,0],_rndnum,"Easy","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	};
	
	//Condition
	_complete = [
		[_mission,_crate],	// mission number and crate
		["kill"], 			// ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_baserunover], 		// cleanup objects
		"<t align='left' color='#D60000' shadow='2' size='1.85'>Bandit Mission</t><br/><br/>
		<t align='left' color='#FFBF00' shadow='2' size='1.75'>Ural Attack</t><br/><br/><t align='left' color='#ffffff'>Heroes are defending a broken down Ural! Check your map for the location!</t><br/>
		<br/><t align='left' color='#61B329' shadow='2' size='1.0'>Difficulty: Easy</t><br/><br/>",	// mission announcement
		"<t align='left' color='#FFBF00' shadow='2' size='1.75'>Ural Attack</t><br/><br/><t align='left' color='#ffffff'>The supplies have been secured by bandits.</t>",																		// mission success
		"<t align='left' color='#FFBF00' shadow='2' size='1.75'>Ural Attack</t><br/><br/><t align='left' color='#ffffff'>Bandits did not secure the supplies in time.</t>"																// mission fail
	] call mission_winorfail;	

	if(_complete) then {
		[_crate,4,8,36,2] call dynamic_crate;
	};

	diag_log format["WAI: [Mission:[Bandit] Ural Attack]: Ended at %1",_position];
	
	b_missionrunning = false;
};