if(isServer) then {
	 
	private 		["_complete","_baserunover","_mission","_directions","_position","_crate","_num","_crate_type","_baserunover0","_baserunover1","_baserunover2","_baserunover3","_baserunover4","_baserunover5","_baserunover6","_baserunover7"];

	_position		= [80] call find_position;
	_mission 		= [_position,"Hard","Hero Base","MainBandit",true] call mission_init;
	
	diag_log 		format["WAI: [Mission:[Bandit] Hero Base]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_large call BIS_fnc_selectRandom;
	_crate 			= createVehicle [_crate_type,[(_position select 0),(_position select 1),0],[],0,"CAN_COLLIDE"];
	
	//Buildings
	_baserunover0 	= createVehicle ["land_fortified_nest_big",[(_position select 0) - 40, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover1 	= createVehicle ["land_fortified_nest_big",[(_position select 0) + 40, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover2 	= createVehicle ["land_fortified_nest_big",[(_position select 0), (_position select 1) - 40,-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover3 	= createVehicle ["land_fortified_nest_big",[(_position select 0), (_position select 1) + 40,-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover4 	= createVehicle ["Land_Fort_Watchtower",[(_position select 0) - 10, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover5 	= createVehicle ["Land_Fort_Watchtower",[(_position select 0) + 10, (_position select 1),-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover6 	= createVehicle ["Land_Fort_Watchtower",[(_position select 0), (_position select 1) - 10,-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover7 	= createVehicle ["Land_Fort_Watchtower",[(_position select 0), (_position select 1) + 10,-0.2],[], 0, "CAN_COLLIDE"];
	_baserunover = [_baserunover0,_baserunover1,_baserunover2,_baserunover3,_baserunover4,_baserunover5,_baserunover6,_baserunover7];
	
	_directions = [90,270,0,180,0,180,270,90];
	{ _x setDir (_directions select _forEachIndex) } forEach _baserunover;
	
	{ _x setVectorUp surfaceNormal position _x; } count _baserunover;
	
	//Group Spawning
	_num = 4 + round (random 3);
	[[_position select 0,_position select 1,0],_num,"hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"hard","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Random","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Random","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Random","Random",4,"Random","Hero","Random","Hero",_mission] call spawn_group;

	//Humvee Patrol
	[[(_position select 0) + 100, _position select 1, 0],[(_position select 0) + 100, _position select 1, 0],50,2,"HMMWV_Armored","Random","Hero","Hero",_mission] call vehicle_patrol;
	 
	//Static Guns
	[[[(_position select 0) - 10, (_position select 1) + 10, 0]],"M2StaticMG","Easy","Hero","Hero",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) + 10, (_position select 1) - 10, 0]],"M2StaticMG","Easy","Hero","Hero",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) + 10, (_position select 1) + 10, 0]],"M2StaticMG","Easy","Hero","Hero",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) - 10, (_position select 1) - 10, 0]],"M2StaticMG","Easy","Hero","Hero",0,2,"Random","Random",_mission] call spawn_static;

	//Heli Paradrop
	[[(_position select 0), (_position select 1), 0],[0,0,0],400,"UH1H_DZ",10,"Random","Random",4,"Random","Hero","Random","Hero",true,_mission] spawn heli_para;

	//Condition
	_complete = [
		[_mission,_crate],	// mission number and crate
		["crate"], 			// ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_baserunover], 	// cleanup objects
		"<t align='left' color='#D60000' shadow='2' size='1.85'>Bandit Mission</t><br/><br/>
		<t align='left' color='#FFBF00' shadow='2' size='1.75'>Hero Base</t><br/><br/><t align='left' color='#ffffff'>Hero forces have set up a heavily fortified base, are you bandit enough to take them down?</t><br/>
		<br/><t align='left' color='#D60000' shadow='2' size='1.0'>Difficulty: Hard</t><br/><br/>",	// mission announcement
		"<t align='left' color='#FFBF00' shadow='2' size='1.75'>Supply Convoy</t><br/><br/><t align='left' color='#ffffff'>Bandits have captured the Hero base.</t>",																		// mission success
		"<t align='left' color='#FFBF00' shadow='2' size='1.75'>Supply Convoy</t><br/><br/><t align='left' color='#ffffff'>Bandits did not capture the base in time.</t>"																// mission fail
	] call mission_winorfail;		

	if(_complete) then {
		[_crate,[16,ai_wep_sniper],[8,crate_tools_sniper],[3,crate_items_high_value],[4,crate_backpacks_large]] call dynamic_crate;
	};

	diag_log format["WAI: [Mission:[Bandit] Hero Base]: Ended at %1",_position];
	
	b_missionrunning = false;
};