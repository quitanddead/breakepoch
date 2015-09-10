waitUntil {(getPlayerUID player) != ""};
_loadList = [
"76561198100048697", // Anarior
"76561198061568644", // Rabbit
"76561198003312030", // NZBeast
"76561198082286254", // Cray
"76561197960488575", // Baz Norton
"76561197967035142", // Zunz
"76561198105697473", // SamIam/JellieBean
"76561198067497016", // Mloaded
"76561198048634331", // Ratfink
"76561198055547860", // Moffee
"76561197960709854", // Spibox
"76561198045908650", // McGiggins
"76561197989248132", // Forcas
"76561198068229299", // Grawlix
"76561198041182522", // [ESGR]InsaneSquared
"76561197987462779", // Chunx
"76561198048901733", //RapidBrad
"76561198009170948" //Sierra
];
_lpID = getPlayerUID player;

/*     Ascent Clan Loadout   */
/*  Anarior, Rabbit, NZBeast */
/*	    Cray, Baz, Zunz	     */

if ((_lpID in ["76561198100048697", "76561198061568644", "76561198003312030", "76561198082286254", "76561197960488575", "76561197967035142"]) && (_lpID in _loadList)) then {
	DefaultMagazines = ["ItemBandage","ItemBandage","ItemBandage","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","ItemMorphine","ItemPainkiller","ItemBloodbag","ItemSodaCoke","FoodCanBakedBeans","ItemGoldBar2oz","Skin_Soldier1_DZ"];
	DefaultWeapons = ["M9SD","Binocular_Vector","NVGoggles","ItemMap","ItemCompass","ItemGPS","ItemWatch","ItemKnife","Itemtoolbox","ItemCrowbar","Itemetool","ItemHatchet_DZE","ItemRadio"];
	DefaultBackpack = "DZ_Backpack_EP1";
	DefaultBackpackItems = ["PartGeneric","PartGeneric","PartEngine","PartFueltank"];
	DZE_defaultSkin = [["Skin_Soldier1_DZ"],["Skin_SurvivorWdesert_DZ"]];
};

/* Donator Loadout Section */

/* Donator Loadout - Sam i am, Mloaded, RatFink, Sierra */
if ((_lpID in ["76561198105697473", "76561198067497016", "76561198048634331","76561198009170948"]) && (_lpID in _loadList)) 
then {
	DefaultMagazines = ["ItemBandage","ItemBandage","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","ItemMorphine","ItemPainkiller","ItemBloodbag","ItemSodaCoke","FoodCanBakedBeans","ItemGoldBar"];
	DefaultWeapons = ["M9SD","NVGoggles","ItemMap","ItemCompass","ItemGPS","ItemWatch","ItemKnife","Itemtoolbox","ItemCrowbar","Itemetool","ItemHatchet_DZE","ItemRadio"];
	DefaultBackpack = "DZ_Backpack_EP1";
	DefaultBackpackItems = [""];
};

/* Donator Pro Loadout - Moffee, Spibox, McGiggins, Forcas, Grawlix, [ESGR]InsaneSquared, RapidBrad */
if ((_lpID in ["76561198055547860", "76561197960709854", "76561198045908650", "76561197989248132", "76561198068229299", "76561198041182522","76561198048901733"]) && (_lpID in _loadList)) 
then {
	DefaultMagazines = ["ItemBandage","ItemBandage","ItemBandage","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","ItemMorphine","ItemPainkiller","ItemBloodbag","ItemSodaCoke","FoodCanBakedBeans","ItemGoldBar"];
	DefaultWeapons = ["M9SD","Binocular_Vector","NVGoggles","ItemMap","ItemCompass","ItemGPS","ItemWatch","ItemKnife","Itemtoolbox","ItemCrowbar","Itemetool","ItemHatchet_DZE","ItemRadio"];
	DefaultBackpack = "DZ_LargeGunBag_EP1";
	DefaultBackpackItems = ["PartGeneric","PartGeneric","PartEngine","PartFueltank"];
};

/*  Skins  */

/* Bandit Baklava - Chunx, RapidBrad */
if ((_lpID in ["76561197987462779","76561198048901733"])  && (_lpID in _loadList))
then {
	DZE_defaultSkin = [["Skin_GUE_Soldier_Crew_DZ"],["Skin_SurvivorWdesert_DZ"]];
};

/* Green Ghillie - Moffee, Spibox, Forcas, [ESGR]InsaneSquared, Brad */
if ((_lpID in ["76561198055547860", "76561197960709854", "76561197989248132", "76561198041182522", "76561198153052118"]) && (_lpID in _loadList))
then {
	DZE_defaultSkin = [["Skin_Sniper1_DZ"],["Skin_SurvivorWdesert_DZ"]];
};

/* Hero - Grawlix */
if ((_lpID in ["76561198068229299"])  && (_lpID in _loadList))
then {
	DZE_defaultSkin = [["Skin_Soldier_Sniper_PMC_DZ"],["Skin_SurvivorWdesert_DZ"]];
};

/* Priest - McGiggins */
if ((_lpID in ["76561198045908650"]) && (_lpID in _loadList))
then {
	DZE_defaultSkin = [["Skin_Priest_DZ"],["Skin_SurvivorWdesert_DZ"]];
};

/* Terrorist - Wid, Rhienheart, Kiff */
if ((_lpID in ["76561197970954396", "76561198068779077", "76561198051704410"])  && (_lpID in _loadList))
then {
	DZE_defaultSkin = [["Skin_Ins_Soldier_GL_DZ"],["Skin_SurvivorWdesert_DZ"]];
};