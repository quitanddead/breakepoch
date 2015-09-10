if(isServer) then {

	private			["_complete","_president_himself","_crate_type","_mission","_position","_crate","_rndnum","_baserunover","_president","_firstlady"];

	_position		= [50] call find_position;
	_mission		= [_position,"Extreme","President in Town","MainBandit",true] call mission_init;
	
	diag_log 		format["WAI: [Mission:[Bandit] Presidents in Town]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_small call BIS_fnc_selectRandom;
	_crate 			= createVehicle ["BAF_VehicleBox",[(_position select 0),(_position select 1),.1], [], 0, "CAN_COLLIDE"];
	
	//Hotel
	_baserunover 	= createVehicle ["Land_A_Office01",[(_position select 0),(_position select 1),0],[],0,"CAN_COLLIDE"];
	_baserunover 	setVectorUp surfaceNormal position _baserunover;

	//Troops
	[[_position select 0,_position select 1,0],4,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;

	//The President Himself
	_president = [[((_position select 0) + 5), _position select 1, 4.1],1,"Extreme","Random",4,"none","Special","Random",["Hero",750],_mission] call spawn_group;
	_firstlady = [[((_position select 0) + 5), _position select 1, 4.1],1,"Easy","Unarmed",4,"none","Secretary1","Random",["Hero",250],_mission] call spawn_group;

	_president_himself = (units _president) select 0;
	_president_himself disableAI "MOVE";

	//Humvee Patrol
	[[(_position select 0) + 100, _position select 1, 0],[(_position select 0) + 100, _position select 1, 0],50,2,"HMMWV_Armored","Random","Hero","Hero",_mission] call vehicle_patrol;

	//Heli Paradrop
	[[(_position select 0),(_position select 1),0],[0,0,0],800,"UH60M_EP1_DZE",6,"Hard","Random",4,"Random","Hero","Random","Hero",false,_mission] spawn heli_para;
	[[(_position select 0) + 50,(_position select 1),0],[50,50,0],800,"UH60M_EP1_DZE",6,"Hard","Random",4,"Random","Hero","Random","Hero",false,_mission] spawn heli_para;
	[[(_position select 0) + 100,(_position select 1),0],[100,0,0],800,"UH60M_EP1_DZE",6,"Random","Random",4,"Random","Hero","Random","Hero",false,_mission] spawn heli_para;
	
	//Static guns
	[[
		[(_position select 0) - 13.135, (_position select 1) + 5.025, 5.27],
		[(_position select 0) + 14.225, (_position select 1) + 5.025, 5.27],
		[(_position select 0) + 1.97, (_position select 1) - 2.368, 10.54]
	],"M2StaticMG","Hard","Hero","Hero",1,2,"Random","Random",_mission] call spawn_static;

	//Condition
	
	
	_complete = [
		[_mission,_crate],			// mission number and crate
		["assassinate",_president], // ["crate",wai_kill_percent], or ["kill"], or ["assassinate", _unitGroup],
		[_baserunover], 			// cleanup objects
		"<t align='left' color='#D60000' shadow='2' size='1.85'>Bandit Mission</t><br/><br/>
		<t align='left' color='#FFBF00' shadow='2' size='1.75'>Presidential Visit</t><br/><br/><t align='left' color='#ffffff'>The US President is visiting Napf to support the heroic survivors, rumour has it bandits are planning his assassination!</t><br/>
		<br/><t align='left' color='#000000' shadow='2' size='1.0'>Difficulty: Extreme</t><br/><br/>",	// mission announcement
		"<t align='left' color='#FFBF00' shadow='2' size='1.75'>Rebel Base</t><br/><br/><t align='left' color='#ffffff'>The President has been assassinated, retribution will be swift!</t>",																		// mission success
		"<t align='left' color='#FFBF00' shadow='2' size='1.75'>Rebel Base</t><br/><br/><t align='left' color='#ffffff'>The President managed to survive the assassination attempt.</t>"																// mission fail
	] call mission_winorfail;		

	if(_complete) then {
		[_crate,[10,ai_wep_sniper],[4,crate_tools_sniper],[4,crate_items_sniper],[6,crate_items_president],2] call dynamic_crate;
	};

	diag_log format["WAI: [Bandit] presidents_mansion ended at %1",_position];

	b_missionrunning = false;
};
