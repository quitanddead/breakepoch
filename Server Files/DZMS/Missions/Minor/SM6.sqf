/*
	Weapon Truck Crash by lazyink (Full credit for code to TheSzerdi & TAW_Tonic)
	Updated to new format by Vampire
*/
private ["_missName","_coords","_crash","_crate","_crate1","_crate2"];

//Name of the Mission
_missName = "Bandit Weapons Truck";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

// Update mission status with debug message
_hint = parseText format["<t align='center' color='#FFBF00' shadow='2' size='1.75'>Bandit Weapons Truck</t><br/><br/><t align='center' color='#ffffff'>A bandit weapons truck has crashed. Check your map for the location!</t><br/><br/><t align='center' color='#61B329' shadow='2' size='1.0'>Difficulty: Easy</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";

//DZMSAddMinMarker is a simple script that adds a marker to the location
[_coords,_missName] ExecVM DZMSAddMinMarker;

//Add scenery
_crash = createVehicle ["UralWreck",_coords,[], 0, "CAN_COLLIDE"];

//DZMSProtectObj prevents it from disappearing
[_crash] call DZMSProtectObj;

//Add and fill the boxes
_crate = createVehicle ["USLaunchersBox",[(_coords select 0) + 3, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate,"weap"] ExecVM DZMSBoxSetup;
[_crate] call DZMSProtectObj;

_crate1 = createVehicle ["USLaunchersBox",[(_coords select 0) - 3, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate1,"weap"] ExecVM DZMSBoxSetup;
[_crate1] call DZMSProtectObj;


//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray]
[_coords,2,1,"DZMSUnitsMinor"] call DZMSAISpawn;
sleep 5;
[_coords,2,1,"DZMSUnitsMinor"] call DZMSAISpawn;
sleep 5;
[_coords,2,1,"DZMSUnitsMinor"] call DZMSAISpawn;
sleep 5;
[_coords,2,1,"DZMSUnitsMinor"] call DZMSAISpawn;
sleep 1;

//Spawn patrol
//Position, Skill
//Usage: [_coords, PatrolRadius ,  skillLevel]
[_coords, 50, 1] call DZMSVehiclePatrol;

//Wait until the player is within 30 meters and also meets the kill req
[_coords,"DZMSUnitsMinor"] call DZMSWaitMissionComp;

//Let everyone know the mission is over
// Update mission status with debug message
_hint = parseText format["<t align='center' color='#FFBF00' shadow='2' size='1.75'>Bandit Weapons Truck</t><br/><br/><t align='center' color='#ffffff'>The crash site has been secured by survivors!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";

diag_log format["[DZMS]: Minor SM6 Ural Crash Mission has Ended."];
deleteMarker "DZMSMinMarker";
deleteMarker "DZMSMinDot";

//Let the timer know the mission is over
DZMSMinDone = true;