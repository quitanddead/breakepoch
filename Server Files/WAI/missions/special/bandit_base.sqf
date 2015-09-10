if(isServer) then {
	 
	private 		["_complete","_baserunover","_mission","_directions","_position","_crate","_num","_crate_type","_baserunover0","_baserunover1","_baserunover2","_baserunover3","_baserunover4","_baserunover5","_baserunover6","_baserunover7"];

	_position		= [80] call find_position;
	_mission 		= [_position,"Extreme","Bandit Base","Special",true] call mission_init;
	
	diag_log 		format["WAI: [Mission:[Neutral] Bandit Base]: Starting... %1",_position];

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
	
	//Troops
	_num = 4 + round (random 3);
	[[_position select 0,_position select 1,0],_num,"hard","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"hard","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Random","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"hard","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Random","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;

	//Humvee Patrol
	[[(_position select 0) + 100, _position select 1, 0],[(_position select 0) + 100, _position select 1, 0],50,2,"HMMWV_Armored","Random","Bandit","Bandit",_mission] call vehicle_patrol;
	 
	//Static Guns
	[[[(_position select 0) - 10, (_position select 1) + 10, 0]],"M2StaticMG","Easy","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) + 10, (_position select 1) - 10, 0]],"M2StaticMG","Easy","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) + 10, (_position select 1) + 10, 0]],"M2StaticMG","Easy","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static;
	[[[(_position select 0) - 10, (_position select 1) - 10, 0]],"M2StaticMG","Easy","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static;

	//Heli Paradrop
	[[(_position select 0), (_position select 1), 0],[0,0,0],400,"UH1H_DZ",10,"Random","Random",4,"Random","Bandit","Random","Bandit",true,_mission] spawn heli_para;

	//Condition
	_complete = [
		[_mission,_crate],	// mission number and crate
		["crate"], 			// ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_baserunover], 	// cleanup objects
		"<t align='left' color='#ffea00' shadow='2' size='1.85'>Neutral Mission</t><br/><br/>
		<t align='left' color='#FFBF00' shadow='2' size='1.75'>Rebel Base</t><br/><br/><t align='left' color='#ffffff'>A rebel task force have set up a temporary encampment! Go and ambush it to make it yours!</t><br/>
		<br/><t align='left' color='#000000' shadow='2' size='1.0'>Difficulty: Extreme</t><br/><br/>",	// mission announcement
		"<t align='left' color='#FFBF00' shadow='2' size='1.75'>Rebel Base</t><br/><br/><t align='left' color='#ffffff'>Survivors have captured the base!</t>",																		// mission success
		"<t align='left' color='#FFBF00' shadow='2' size='1.75'>Rebel Base</t><br/><br/><t align='left' color='#ffffff'>Survivors were unable to capture the base.</t>"																// mission fail
	] call mission_winorfail;
	
	if(_complete) then {
		[_crate,[16,ai_wep_sniper],[8,crate_tools_sniper],[3,crate_items_high_value],[4,crate_backpacks_large]] call dynamic_crate;
	};

	diag_log format["WAI: [Mission:[Neutral] Bandit Base]: Ended at %1",_position];

	h_missionrunning = false;
};