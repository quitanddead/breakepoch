if(isServer) then {

	private			["_room","_complete","_mayor_himself","_crate_type","_mission","_position","_crate","_baserunover","_mayor"];

	_position		= [40] call find_position;
	_mission		= [_position,"Hard","Rebel Headquarters","MainHero",true] call mission_init;
	
	diag_log 		format["WAI: [Mission:[Hero] Rebel Headquarters]: Starting... %1",_position];

	//Setup the crate
	_crate_type 	= crates_large call BIS_fnc_selectRandom;
	_crate 			= createVehicle ["BAF_VehicleBox",[(_position select 0),(_position select 1),0], [], 0, "CAN_COLLIDE"];
	 
	//Mayors Mansion
	_baserunover 	= createVehicle ["Land_A_Villa_EP1",[(_position select 0), (_position select 1),0],[], 0, "CAN_COLLIDE"];
	_baserunover 	setVectorUp surfaceNormal position _baserunover;

	//Troops
	[[_position select 0,_position select 1,0],4,"Hard","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Hard","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Hard","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;
	[[_position select 0,_position select 1,0],4,"Hard","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group;

	//The Mayor Himself
	_mayor = [_position,1,"Hard","Random",4,"Random","Special","Random",["Bandit",500],_mission] call spawn_group;
	_mayor_himself = (units _mayor) select 0;
	
	//Put the Mayor in his room
	_room = (6 + ceil(random(3)));
	_mayor_himself disableAI "MOVE";
	_mayor_himself setPos (_baserunover buildingPos _room);
	
	//Let him move once player is near
	_mayor_himself spawn {
		private ["_mayor","_player_near"];
		_mayor = _this;
		_player_near = false;
		waitUntil {
			{
				if (isPlayer _x && (_x distance (position _mayor) < 20)) then { _player_near = true; };
			} count playableUnits;
			sleep .1;
			(_player_near)
		};
		_mayor enableAI "MOVE";
	};

	//Static mounted guns
	[[
		[(_position select 0) - 15, (_position select 1) + 15, 8],
		[(_position select 0) + 15, (_position select 1) - 15, 8]
	],"M2StaticMG","Easy","Bandit","Bandit",1,2,"Random","Random",_mission] call spawn_static;	
	
	//Condition
	_complete = [
		[_mission,_crate],		// mission number and crate
		["assassinate",_mayor], // ["crate"], or ["kill"], or ["assassinate", _unitGroup],
		[_baserunover], 		// cleanup objects
		"<t align='left' color='#5882FA' shadow='2' size='1.85'>Hero Mission</t><br/><br/>
		<t align='left' color='#FFBF00' shadow='2' size='1.75'>Rebel Headquarters</t><br/><br/><t align='left' color='#ffffff'>The Headquarters of rebel forces on Napf has been located, take out leader Klaus von Schnitzel and his guards!</t><br/>
		<br/><t align='left' color='#D60000' shadow='2' size='1.0'>Difficulty: Hard</t><br/><br/>",	// mission announcement
		"<t align='left' color='#FFBF00' shadow='2' size='1.75'>Rebel Headquarters</t><br/><br/><t align='left' color='#ffffff'>The rebel Headquarters have been captured by a group of heroes!</t>",																		// mission success
		"<t align='left' color='#FFBF00' shadow='2' size='1.75'>Rebel Headquarters</t><br/><br/><t align='left' color='#ffffff'>Survivors were unable to capture the rebel Headquarters.</t>"																// mission fail
	] call mission_winorfail;	

	if(_complete) then {
		[_crate,16,4,0,4] call dynamic_crate;
	};

	diag_log format["WAI: [Mission:[Hero] Rebel Headquarters]: Ended at %1",_position];

	h_missionrunning = false;
};
