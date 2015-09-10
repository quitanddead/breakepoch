DZE_SafePlot_Player_Distance = 30;
DZE_Safeplot_Remove_Radius = 75;

if(isServer) exitWith {};
diag_log text "SAFEPLOT: Loading settings...";
diag_log text "SAFEPLOT: Starting...";
[] spawn {
    diag_log text "SAFEPLOT: Waiting for player";
    waitUntil {!(isNull player);};
    diag_log text "SAFEPLOT: Starting zombie removal";
    while {!(isNull player)} do {
        private["_removedZombies"];
        _removedZombies = 0;
        {
            {
				_removedZombies = _removedZombies + 1;
                deleteVehicle _x;
            } forEach (_x nearEntities ["zZombie_Base",DZE_Safeplot_Remove_Radius]);
        } forEach ((position player) nearObjects["Plastic_Pole_EP1_DZ",DZE_SafePlot_Player_Distance]);
        if (_removedZombies > 0) then {
            diag_log text format["SAFEPLOT: Removed %1 zombies near plot poles",_removedZombies];
        };
        sleep 5;
    };
};