
startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];

dayZ_instance 				= 24;
dayzHiveRequest 			= [];
initialized 				= false;
dayz_previousID 			= 0;

DZEdebug 					= false;
player setVariable ["BIS_noCoreConversations", true];
enableRadio false;
enableSentences false;

spawnShoremode 				= 0;
spawnArea					= 1200;
dayz_paraSpawn 				= false;
dayz_minpos 				= -1000;
dayz_maxpos 				= 26000;
dayz_MapArea 				= 18000;

setViewDistance 1500;

DZE_ConfigTrader 			= true;	
DZE_MissionLootTable 		= false;

MaxVehicleLimit 			= 400;
MaxDynamicDebris 			= 0;
MaxAmmoBoxes 				= 6;
MaxMineVeins 				= 0; 

dayz_sellDistance_vehicle 	= 25;
dayz_sellDistance_boat 		= 40;
dayz_sellDistance_air 		= 50;

dayz_maxAnimals 			= 6;
dayz_tameDogs 				= true;
dayz_fullMoonNights 		= true;

DynamicVehicleDamageLow 	= 25;
DynamicVehicleDamageHigh 	= 80;
DynamicVehicleFuelLow 		= 20;
DynamicVehicleFuelHigh 		= 85;

DZE_ForceNameTagsInTrader 	= true;
DZE_ForceNameTagsOff 		= true;

DZE_PlayerZed 				= false;
dayz_zedsAttackVehicles 	= false;
dayz_maxLocalZombies 		= 7;
dayz_maxZeds 				= 100; 

DZE_SelfTransfuse 			= true;
DZE_selfTransfuse_Values 	= [12000, 1000, 60];

DZE_R3F_WEIGHT 				= false;

DZE_FriendlySaving 			= false;

DZE_requireplot				= 1;
DZE_PlotPole 				= [45,75];
DZE_BuildingLimit 			= 300;
DZE_GodModeBase 			= true;
DZE_BuildOnRoads 			= false;
DZE_snapExtraRange 			= 0;
DZE_StaticConstructionCount = 1;

DZE_DeathMsgGlobal 			= false;
DZE_DeathMsgSide 			= true;
DZE_DeathMsgTitleText 		= false;

DZE_BackpackGuard 			= false;
DZE_TRADER_SPAWNMODE 		= false; 

EpochEvents = [
	["any","any","any","any",0,"crash_spawner"],
	["any","any","any","any",20,"supply_drop"],
	["any","any","any","any",50,"supply_drop"]
];

DefaultMagazines = ["FoodSteakCooked","ItemBandage","ItemPainkiller","15Rnd_9x19_M9"];
DefaultWeapons = ["M9","ItemMap","ItemCompass","ItemWatch","ItemToolbox","ItemRadio"];
DefaultBackpack = "DZ_Patrol_Pack_EP1";
DefaultBackpackItems = [""];

//Load in compiled functions
call compile preprocessFileLineNumbers "dayz_code\init\variables.sqf";
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "dayz_code\init\compiles.sqf";
progressLoadingScreen 0.5;
call compile preprocessFileLineNumbers "server_traders.sqf";
call compile preprocessFileLineNumbers "scripts\bike\init.sqf";
call compile preprocessFileLineNumbers "scripts\suicide\init.sqf";
call compile preprocessFileLineNumbers "scripts\messages\remote_messages.sqf";

progressLoadingScreen 1.0;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

DZE_PlayerZed 				= false;
dayz_zedsAttackVehicles 	= false;
dayz_maxLocalZombies 		= 10;
dayz_maxZeds 				= 350; 

if (isServer) then {
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\dayz_epoch_24.napf\dynamic_vehicle.sqf";				
	_nil = [] execVM "\z\addons\dayz_server\missions\dayz_epoch_24.napf\mission.sqf";
	_serverMonitor = 	[] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
	"HumanityChange" addPublicVariableEventHandler {[_this select 1] execVM 'scripts\humanity\humanitychange.sqf'};
};

if (!isDedicated) then {
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	
	[] execVM "scripts\loadout.sqf";
	
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = 	[] execVM "\z\addons\dayz_code\system\player_monitor.sqf";	
	
	[] execVM "scripts\novoice.sqf";
	[] execVM "scripts\intro.sqf";
	[] execVM "scripts\messages\kill_msg.sqf";
	[] execVM "scripts\dzgm\init.sqf";
	[] execVM "scripts\service_point\service_point.sqf";
	_nil = [] execVM "scripts\VehicleKeyChanger\VehicleKeyChanger_init.sqf";
	_nil = [] execVM "scripts\evac\EvacChopper_init.sqf";
};
//execVM "dayz_code\external\DynamicWeatherEffects.sqf";
#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf"
[] execVM "scripts\logistic\init.sqf";
[] execVM "scripts\nametags.sqf";
[] execVM "scripts\safezones\.sqf";
[] execVM "scripts\safezones\safeplot.sqf";
DZE_noRotate = ["ItemVault","ItemWoodStairs","ItemLockbox","ItemWoodStairsSupport","ItemWoodLadder","30m_plot_kit"];
DZE_curPitch = 45; // Starting rotation angle. Only 1, 5, 45, or 90.
call compile preprocessFileLineNumbers "scripts\time\time_control.sqf";