// Only Traders in this SQF. All buildings are in the included SQF files.

if (isServer) then {

  // Bruderholz
  call compile preProcessFileLineNumbers "z\addons\dayz_server\missions\DayZ_Epoch_24.Napf\lenzburg.sqf";

  // Farnen
  call compile preProcessFileLineNumbers "z\addons\dayz_server\missions\DayZ_Epoch_24.Napf\farnen.sqf";  
  
  // West Wholesale
  call compile preProcessFileLineNumbers "z\addons\dayz_server\missions\DayZ_Epoch_24.Napf\ww.sqf";  
  
  // Hero
  call compile preProcessFileLineNumbers "z\addons\dayz_server\missions\DayZ_Epoch_24.Napf\hero.sqf";   
  
  // Bandit
  call compile preProcessFileLineNumbers "z\addons\dayz_server\missions\DayZ_Epoch_24.Napf\bandit.sqf";   

  // Neaf
  call compile preProcessFileLineNumbers "z\addons\dayz_server\missions\DayZ_Epoch_24.Napf\neaf.sqf";  

  // Seaf
  call compile preProcessFileLineNumbers "z\addons\dayz_server\missions\DayZ_Epoch_24.Napf\seaf.sqf";  

  // Veteran Traders
  call compile preProcessFileLineNumbers "z\addons\dayz_server\missions\DayZ_Epoch_24.Napf\veteran.sqf";  

  // Alpnach Trader
  call compile preProcessFileLineNumbers "z\addons\dayz_server\missions\DayZ_Epoch_24.Napf\alpnach.sqf";  
 
  // Military Enclave
  call compile preProcessFileLineNumbers "z\addons\dayz_server\missions\DayZ_Epoch_24.Napf\militaryenclave.sqf";   

/*  Lenzburg Tradercity  */
  

_unit_1 = objNull;
if (true) then
{
  _this = createAgent ["RU_Policeman", [8264.5371, 15495.855, 3.7374172], [], 0, "CAN_COLLIDE"];
  _unit_1 = _this;
  _this setDir 56.102802;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;};

_unit_2 = objNull;
if (true) then
{
  _this = createAgent ["Villager1", [8266.668, 15482.221, 0.10264076], [], 0, "CAN_COLLIDE"];
  _unit_2 = _this;
  _this setDir -141.76392;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;};

_unit_3 = objNull;
if (true) then
{
  _this = createAgent ["RU_Profiteer4", [8254.9502, 15509.599, 0.23239325], [], 0, "CAN_COLLIDE"];
  _unit_3 = _this;
  _this setDir -170.64685;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;};

_unit_4 = objNull;
if (true) then
{
  _this = createAgent ["RU_Housewife3", [8262.2666, 15499.865, 0.28269568], [], 0, "CAN_COLLIDE"];
  _unit_4 = _this;
  _this setDir -131.36397;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;};
};

_unit_5 = objNull;
if (true) then
{
  _this = createAgent ["RU_Doctor", [8243.2871, 15505.409, -2.8610229e-005], [], 0, "CAN_COLLIDE"];
  _unit_5 = _this;
  _this setDir 134.79477;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;
}; 

/* Trader City Farnen */


_unit_77 = objNull;
if (true) then
{
  _this = createAgent ["Damsel1", [13153.915, 6363.8174, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
  _unit_77 = _this;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;
};

_unit_78 = objNull;
if (true) then
{
  _this = createAgent ["Profiteer1", [13159.152, 6380.3999, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
  _unit_78 = _this;
  _this setDir -83.359169;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;
};

_unit_79 = objNull;
if (true) then
{
  _this = createAgent ["Woodlander3", [13161.42, 6390.6172, 4.5776367e-005], [], 0, "CAN_COLLIDE"];
  _unit_79 = _this;
  _this setDir -87.776962;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;
};

_unit_80 = objNull;
if (true) then
{
  _this = createAgent ["Pilot_EP1", [13179.943, 6389.8286, -6.1035156e-005], [], 0, "CAN_COLLIDE"];
  _unit_80 = _this;
  _this setDir 201.3291;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;
};

_unit_81 = objNull;
if (true) then
{
  _this = createAgent ["TK_CIV_Takistani04_EP1", [13182.86, 6383.4272], [], 0, "CAN_COLLIDE"];
  _unit_81 = _this;
  _this setDir -85.654266;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;
};

_unit_82 = objNull;
if (true) then
{
  _this = createAgent ["Dr_Hladik_EP1", [13132.366, 6379.4004, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
  _unit_82 = _this;
  _this setDir 50.214973;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;
};

//Black Market
 _unit_83 = objNull;
if (true) then
{
  _this = createAgent ["TK_CIV_Takistani06_EP1", [13179.463, 6360.5068, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
  _unit_83 = _this;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;

};


  //#######################################################  Worb Trader City/West Wholesale  ###########################################################
  //####################################################################################################################################################
  

_unit_16 = objNull;
if (true) then
{
  _this = createAgent ["RU_Damsel5", [2036.7937, 7792.8916, 0.92115474], [], 0, "CAN_COLLIDE"];
  _unit_16 = _this;
  _this setDir -89.783592;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;

};

_unit_18 = objNull;
if (true) then
{
  _this = createAgent ["Farmwife2", [1981.036, 7848.6533, 6.1175971], [], 0, "CAN_COLLIDE"];
  _unit_18 = _this;
  _this setDir -85.900726;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;

};

_unit_20 = objNull;
if (true) then
{
  _this = createAgent ["HouseWife3", [2027.068, 7786.6763, 1.2264824], [], 0, "CAN_COLLIDE"];
  _unit_20 = _this;
   _this setDir -6.3995233;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;

};

  //####################################################### East Wholesale  #################################################################
  //#########################################################################################################################################
  


_unit_22 = objNull;
if (true) then
{
  _this = createAgent ["Citizen4", [16835.516, 5278.8198, 1.0711187], [], 0, "CAN_COLLIDE"];
  _unit_22 = _this;
  _this setDir 111.11587;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;

};

_unit_24 = objNull;
if (true) then
{
  _this = createAgent ["RU_Damsel1", [16823.066, 5238.7017, 0.93685299], [], 0, "CAN_COLLIDE"];
  _unit_24 = _this;
  _this setDir 8.4619808;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;

};

_unit_26 = objNull;
if (true) then
{
  _this = createAgent ["RU_Damsel3", [16797.248, 5243.8091, 0.9854908], [], 0, "CAN_COLLIDE"];
  _unit_26 = _this;
  _this setDir 84.072723;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;

};

  //####################################################### Hero Camp  ######################################################################
  //#########################################################################################################################################
  
_unit_28 = objNull;
if (true) then
{
  _this = createAgent ["FR_Assault_GL", [11061.677, 11817.201, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
  _unit_28 = _this;
  _this setDir 153.6106;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;

};

_unit_30 = objNull;
if (true) then
{
  _this = createAgent ["US_Soldier_AHAT_EP1", [11055.939, 11815.154, 4.5776367e-005], [], 0, "CAN_COLLIDE"];
  _unit_30 = _this;
  _this setDir 139.18291;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;

};

_unit_32 = objNull;
if (true) then
{
  _this = createAgent ["FR_Corpsman", [11049.502, 11811.131, 0.068239354], [], 0, "CAN_COLLIDE"];
  _unit_32 = _this;
  _this setDir 84.255875;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;

};

_unit_34 = objNull;
if (true) then
{
  _this = createAgent ["FR_Sapper", [11087.16, 11773.656, -0.00021362305], [], 0, "CAN_COLLIDE"];
  _unit_34 = _this;
  _this setDir -46.433121;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;

};

  //####################################################### Bandit Camp  ####################################################################
  //#########################################################################################################################################
  

_unit_36 = objNull;
if (true) then
{
  _this = createAgent ["Soldier_AT_PMC", [12779.198, 5294.6304, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
  _unit_36 = _this;
  _this setDir 183.56004;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;

};

_unit_38 = objNull;
if (true) then
{
  _this = createAgent ["Poet_PMC", [12800.687, 5278.5908, 10.724226], [], 0, "CAN_COLLIDE"];
  _unit_38 = _this;
  _this setDir 250.24535;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;

};

_unit_40 = objNull;
if (true) then
{
  _this = createAgent ["Dixon_PMC", [12816.079, 5284.4551, 14.089036], [], 0, "CAN_COLLIDE"];
  _unit_40 = _this;
  _this setDir -118.50132;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;

};

_unit_42 = objNull;
if (true) then
{
  _this = createAgent ["Soldier_Medic_PMC", [12801.702, 5303.6577, 10.663816], [], 0, "CAN_COLLIDE"];
  _unit_42 = _this;
  _this setDir -37.305664;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;

};

// South East Air Field //

_unit_3522 = objNull;
if (true) then
{
  _this = createAgent ["USMC_Soldier_Crew", [18564.844, 2515.7451, 0.001], [], 0, "CAN_COLLIDE"];
  _unit_3522 = _this;
  _this setDir 37.149963;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;  ";
  _this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;};


  //#######################################################  Military Trader City  ############################################################
  //#########################################################################################################################################
/*
_unit_46 = objNull;
if (true) then
{
  _this = createAgent ["BAF_Soldier_AAA_MTP", [18182.498, 2140.7607, 0.011451858], [], 0, "CAN_COLLIDE"];
  _unit_46 = _this;
  _this setDir -169.14951;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;

};

_unit_48 = objNull;
if (true) then
{
  _this = createAgent ["BAF_Soldier_FAC_DDPM", [18184.037, 2139.2825, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
  _unit_48 = _this;
  _this setDir -162.73315;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;

};

_unit_52 = objNull;
if (true) then
{
  _this = createAgent ["CDF_Soldier_Crew", [18160.416, 2122.6165, 6.1035156e-005], [], 0, "CAN_COLLIDE"];
  _unit_52 = _this;
  _this setDir 30.106567;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;

};

_unit_54 = objNull;
if (true) then
{
  _this = createAgent ["BAF_Soldier_EN_MTP", [18160.861, 2147.3975, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
  _unit_54 = _this;
  _this setDir -242.38445;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
_this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;

};

_unit_56 = objNull;
if (true) then
{
  _this = createAgent ["TK_Commander_EP1_DZ", [18177.064, 2145.1038, 0.00012207031], [], 0, "CAN_COLLIDE"];
  _unit_56 = _this;
  _this setDir -158.73273;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
  _this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;

}; */



  //############################################################  NEAF  #####################################################################
  //#########################################################################################################################################


_unit_58 = objNull;
if (true) then
{
  _this = createAgent ["Drake_Light", [14826.737, 16414.869, 5.9127808e-005], [], 0, "CAN_COLLIDE"];
  _unit_58 = _this;
  _this setDir 45;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
  _this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;
};

_unit_60 = objNull;
if (true) then
{
  _this = createAgent ["GUE_Woodlander3", [14828.657, 16412.555, -7.8201294e-005], [], 0, "CAN_COLLIDE"];
  _unit_60 = _this;
  _this setDir 45;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
  _this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;
};

  //############################################################  SWAF  #####################################################################
  //#########################################################################################################################################

//SuperHero
_unit_62 = objNull;
if (true) then
{
  _this = createAgent ["US_Soldier_Officer_EP1", [5158.3613, 4845.1001], [], 0, "CAN_COLLIDE"];
  _unit_62 = _this;
  _this setDir -108.36349;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
  _this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;
};

//SuperBandit
_unit_64 = objNull;
if (true) then
{
  _this = createAgent ["RUS_Commander", [5149.9736, 4884.877, -7.6293945e-006], [], 0, "CAN_COLLIDE"];
  _unit_64 = _this;
  _this setDir 157.80948;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
  _this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;
};

  //############################################################  Alpnach  #####################################################################
  //#########################################################################################################################################

_unit_66 = objNull;
if (true) then
{
  _this = createAgent ["FR_Assault_R", [18684.695, 9424.7109, 0.20368665], [], 0, "CAN_COLLIDE"];
  _unit_66 = _this;
  _this setDir 106.50694;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
  _this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;
};

_unit_68 = objNull;
if (true) then
{
  _this = createAgent ["USMC_Soldier_AA", [18684.896, 9425.6963, 0.17319374], [], 0, "CAN_COLLIDE"];
  _unit_68 = _this;
  _this setDir 102.8781;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
  _this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;
};

_unit_70 = objNull;
if (true) then
{
  _this = createAgent ["RU_Citizen2", [18693.232, 9430.4082, -0.00019264221], [], 0, "CAN_COLLIDE"];
  _unit_70 = _this;
  _this setDir 109.43482;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
  _this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;
};

_unit_72 = objNull;
if (true) then
{
  _this = createAgent ["RU_Citizen1", [18688.713, 9444.2822, 0.20271748], [], 0, "CAN_COLLIDE"];
  _unit_72 = _this;
  _this setDir 76.811394;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
  _this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;
};

_unit_74 = objNull;
if (true) then
{
  _this = createAgent ["Citizen3", [18689.031, 9440.8574, 0.31245276], [], 0, "CAN_COLLIDE"];
  _unit_74 = _this;
  _this setDir 38.756207;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
  _this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;
};

_unit_76 = objNull;
if (true) then
{
  _this = createAgent ["Citizen2", [18682.371, 9469.0791, -7.9154968e-005], [], 0, "CAN_COLLIDE"];
  _unit_76 = _this;
  _this setDir 103.06963;
  _this setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
  _this setUnitAbility 0.60000002;
  _this allowDammage false; _this disableAI 'FSM'; _this disableAI 'MOVE'; _this disableAI 'AUTOTARGET'; _this disableAI 'TARGET'; _this setBehaviour 'CARELESS'; _this forceSpeed 0;_this enableSimulation false;
};

};