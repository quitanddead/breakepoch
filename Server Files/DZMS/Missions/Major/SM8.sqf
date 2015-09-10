/*																					//
	Weapons Cache Mission by lazyink (Original Full Code by TheSzerdi & TAW_Tonic)
	New Mission Format by Vampire
	Edited by Fuchs for EMS
*/	

private ["_missName","_coords","_vehicle","_crate","_crate2"];

//Name of the Mission
_missName = "C-130 Crash";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

//DZMSAddMajMarker is a simple script that adds a marker to the location
[_coords,_missname] ExecVM DZMSAddMajMarker;

// Update mission status with debug message
_hint = parseText format["<t align='center' color='#FFBF00' shadow='2' size='1.75'>C-130 Crash</t><br/><br/><t align='center' color='#ffffff'>A C-130 has crash landed! Secure it's cargo for yourself!</t><br/><br/><t align='center' color='#5882FA' shadow='2' size='1.0'>Difficulty: Medium</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";


_vehicle = createVehicle ["C130J_wreck_EP1",[(_coords select 0) + 35, (_coords select 1) - 5,0],[], 0, "NONE"];
_crate = createVehicle ["USVehicleBox",[(_coords select 0) - 20, _coords select 1,0],[], 0, "CAN_COLLIDE"];
_crate2 = createVehicle ["MedBox0",[(_coords select 0) + 20, _coords select 1,0],[], 0, "CAN_COLLIDE"];

//DZMSBoxFill fills the box, DZMSProtectObj prevents it from disappearing
[_crate,"weapons"] ExecVM DZMSBoxSetup;
[_crate2,"meds"] ExecVM DZMSBoxSetup;
[_crate] call DZMSProtectObj;
[_crate2] call DZMSProtectObj;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray]
[[(_coords select 0) + 0.0352,(_coords select 1) - 6.8799, 0],6,1,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;
[[(_coords select 0) + 0.0352,(_coords select 1) - 6.8799, 0],6,1,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;
[[(_coords select 0) + 0.0352,(_coords select 1) - 6.8799, 0],4,1,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;
[[(_coords select 0) + 0.0352,(_coords select 1) - 6.8799, 0],4,1,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;

//Spawn patrol
//Position, Skill
//Usage: [_coords, PatrolRadius ,  skillLevel]
[_coords, 50, 2] call DZMSVehiclePatrol;

//Wait until the player is within 30 meters and also meets the kill req
[_coords,"DZMSUnitsMajor"] call DZMSWaitMissionComp;

//Let everyone know the mission is over
// Update mission status with debug message
_hint = parseText format["<t align='center' color='#FFBF00' shadow='2' size='1.75'>C-130 Crash</t><br/><br/><t align='center' color='#ffffff'>The gear from the C-130 has been recovered!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";

diag_log format["[DZMS]: Major SM8 C130 Mission has Ended."];
deleteMarker "DZMSMajMarker";
deleteMarker "DZMSMajDot";

//Let the timer know the mission is over
DZMSMajDone = true;