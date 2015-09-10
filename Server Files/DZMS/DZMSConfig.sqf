/*
	DayZ Mission System Config by Vampire
	DZMS: https://github.com/SMVampire/DZMS-DayZMissionSystem
*/

///////////////////////////////////////////////////////////////////////
// Do you want your players to gain humanity from killing mission AI?
DZMSMissHumanity = true;

// How Much Humanity?
DZMSCntHumanity = 20;

// Do You Want AI to use NVGs?
//(They are deleted on death)
DZMSUseNVG = true;

// Do you want AI to use RPG7V's?
//(Only one unit per group spawn will have one)
DZMSUseRPG = true;

// Do you want AI kills to count as bandit kills?
DZMSCntBanditKls = true;

// Do you want AI to disappear instantly when killed?
DZMSCleanDeath = false;

// Do you want AI that players run over to not have gear?
// (If DZMSCleanDeath is true, this doesn't matter)
DZMSRunGear = true;

// How long before bodies disappear? (in seconds) (default = 2400)
DZMSBodyTime = 2400;

// Percentage of AI that must be dead before mission completes (default = 0)
//( 0 is 0% of AI / 0.50 is 50% / 1 is 100% )
DZMSRequiredKillPercent = 1;

// How long in seconds before mission scenery disappears (default = 1800 / 0 = disabled)
DZMSSceneryDespawnTimer = 1800;

// Should crates despawn with scenery? (default = false)
DZMSSceneryDespawnLoot = false;

//////////////////////////////////////////////////////////////////////////////////////////
// You can adjust the weapons that spawn in weapon crates inside DZMSWeaponCrateList.sqf
// You can adjust the AI's gear inside DZMSAIConfig.sqf in the ExtConfig folder also.
//////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////
// Do you want to use static coords for missions?
// Leave this false unless you know what you are doing.
DZMSStaticPlc = true;

// Array of static locations. X,Y,Z
DZMSStatLocs = [
[10185,10306,0],
[11180,18313,0],
[10049,18488,0],
[10631,18568,0],
[10304,17658,0],
[11081,17179,0],
[9829,17146,0],
[9246,16745,0],
[8740,16831,0],
[8148,16711,0],
[9479,15937,0],
[8704,15400,0],
[7728,15336,0],
[7127,15429,0],
[5925,16157,0],
[6109,15490,0],
[5003,15614,0],
[5573,14472,0],
[4686,14935,0],
[3875,13984,0],
[5446,13647,0],
[4556,12971,0],
[5488,13148,0],
[5436,12258,0],
[6304,13223,0],
[6950,13712,0],
[7431,14574,0],
[8601,14736,0],
[9589,14918,0],
[10269,14382,0],
[10521,15350,0],
[11190,15469,0],
[11427,15946,0],
[11389,15050,0],
[11230,14661,0],
[11813,14599,0],
[11928,13951,0],
[10990,14202,0],
[13220,15110,0],
[13090,16063,0],
[13055,14312,0],
[13060,13551,0],
[14025,13140,0],
[14753,13330,0],
[15526,12095,0],
[13604,11903,0],
[12776,12619,0],
[12334,12073,0],
[11713,13105,0],
[11080,12477,0],
[9801,12851,0],
[9499,13771,0],
[8880,13916,0],
[7868,13816,0],
[7289,12978,0],
[6549,12332,0],
[7307,12033,0],
[6646,11559,0],
[6748,10793,0],
[7242,10896,0],
[5753,10387,0],
[6040,9681,0],
[5137,9771,0],
[4803,10332,0],
[4222,11023,0],
[3309,9955,0],
[2833,10599,0],
[2990,11118,0],
[3471,11666,0],
[2905,12389,0],
[2349,12404,0],
[2506,11786,0],
[1798,11120,0],
[850,10985,0],
[1025,10457,0],
[1776,10222,0],
[2686,9519,0],
[1516,8908,0],
[2863,8985,0],
[3870,8699,0],
[4825,9078,0],
[4673,8330,0],
[3905,7317,0],
[2661,6776,0],
[4671,6325,0],
[5521,7310,0],
[3631,5147,0],
[5052,5325,0],
[4668,3487,0],
[5536,2300,0],
[6998,4556,0],
[6377,5863,0],
[7279,5517,0],
[8429,4681,0],
[9913,5369,0],
[8521,5828,0],
[9187,4556,0],
[6998,6621,0],
[10115,6349,0],
[9504,8220,0],
[8599,8130,0],
[7254,8793,0],
[9793,9000,0],
[10402,8349,0],
[11646,9005,0],
[11033,9977,0],
[11881,10191,0],
[12217,9660,0],
[13873,10074,0],
[12038,11149,0],
[14579,10964,0],
[14901,11710,0],
[15821,11418,0],
[19048,13114,0],
[17317,11859,0],
[12965,5227,0],
[14530,5238,0],
[15489,5540,0],
[16563,4740,0],
[16254,4025,0],
[16253,3497,0],
[16361,3125,0],
[16768,2849,0],
[17684,2902,0],
[18148,3721,0],
[18052,4058,0],
[19104,6691,0],
[16153,8026,0],
[19082,12026,0],
[18474,16943,0],
[17336,13114,0],
[1336,12117,0]
];

///////////////////////////////////////////////////////////////////////////////////////////////////////////
// Do you want vehicles from missions to save to the Database? (this means they will stay after a restart)
// If False, vehicles will disappear on restart. It will warn a player who gets inside of a vehicle.
// This is experimental, and off by default in this version.
DZMSSaveVehicles = false;

/////////////////////////////////////////////////////////////////////////////////////////////
// These are arrays of vehicle classnames for the missions.
// Adjust to your liking.

//Armed Choppers (Huey)
DZMSChoppers = ["UH1H_DZE","Mi17_DZE"];

//Small Vehicles (Humvees)
DZMSSmallVic = ["hilux1_civil_3_open_EP1","SUV_TK_CIV_EP1","HMMWV_DZ","UAZ_Unarmed_UN_EP1"];

//Large Vehicles (Urals)
DZMSLargeVic = ["Ural_TK_CIV_EP1","Ural_INS"];

//Patrol Vehicles
DZMSPatrolVeh = ["HMMWV_M1151_M2_CZ_DES_EP1_DZ","HMMWV_M998A2_SOV_DES_EP1_DZ","LandRover_Special_CZ_EP1","Offroad_DSHKM_Gue_DZ","Pickup_PK_GUE_DZ","Pickup_PK_INS","Pickup_PK_TK_GUE_EP1"];


/*///////////////////////////////////////////////////////////////////////////////////////////
There are two types of missions that run simultaneously on a the server.
The two types are Major and Minor missions.

Major missions have a higher AI count, but also have more crates to loot.
Minor missions have less AI than Major missions, but have crates that reflect that.

Below is the array of mission file names and the minimum and maximum times they run.
Do not edit the Arrays unless you know what you are doing.
*/
DZMSMajorArray = ["SM1","SM2","SM3","SM4","SM5","SM6","SM7","SM8","SM9","SM10","SM11"];
DZMSMinorArray = ["SM1","SM2","SM3","SM4","SM5","SM6"];

/////////////////////////////////////////////////////////////////////////////////////////////
// The Minumum time in seconds before a major mission will run.
// At least this much time will pass between major missions. Default = 650 (10.8 Minutes)
DZMSMajorMin = 240;

// Maximum time in seconds before a major mission will run.
// A major mission will always run before this much time has passed. Default = 2000 (33.33 Minutes)
DZMSMajorMax = 600;

// Time in seconds before a minor mission will run.
// At least this much time will pass between minor missions. Default = 600 (10 Minutes)
DZMSMinorMin = 240;

// Maximum time in seconds before a minor mission will run.
// A minor mission will always run before this much time has passed. Default = 990 (16.5 Minutes)
DZMSMinorMax = 600;

// Blacklist Zone Array -- missions will not spawn in these areas
// format: [[x,y,z],radius]
// Ex: [[06325,07807,0],300] //Starry Sobor
DZMSBlacklistZones = [
	[[8259.3721,15472.314],500], // Lenzburg
	[[9165.1318,5437.4268],500], // Schangen
	[[18179.379,2129.0427],500], // Military
	[[12823.385,5274.624],500], // Bandit camp
	[[11066.576,11799.943],500], // Hero vendor
	[[2025.4277,7801.5674],250], // Wholesaler W
	[[16832.439,5238.2793],250], // Wholesaler E
	[[8990.2393,7554.8857],200], // Black Market
	[[18688.715,9442.4629],300] // Alpnach
];

/*=============================================================================================*/
// Do Not Edit Below This Line
/*=============================================================================================*/
DZMSVersion = "1.1FIN";
