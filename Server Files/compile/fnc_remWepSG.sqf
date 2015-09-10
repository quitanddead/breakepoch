{
	 //Jackal remove M2 ammo
	 if (_object isKindOf "BAF_Jackal2_L2A1_w") then {
		 _object removeMagazine "100Rnd_127x99_M2";
	 };
 
	 //Pook remove M60 Ammo
	 if (_object isKindOf "pook_H13_transport") then {
		 _object removeMagazine "100Rnd_762x51_M240";
	 };
	 
	 //LAV25_DZE
	 if (_object isKindOf "LAV25_DZE") then {
		 _object WeaponsTurret [-1];	 
		 _object removeMagazinesTurret ["M242",[-1]];		
		 _object removeWeapon "M242";	  
	 };	

	 //BTR90_DZE
	 if (_object isKindOf "BTR90_DZE") then {
		 _object WeaponsTurret [-1];	 
		 _object removeMagazinesTurret ["2A42",[-1]];	
		 _object removeMagazinesTurret ["AGS17",[-1]];	
		 _object removeMagazinesTurret ["AT5LauncherSingle",[-1]];			 
		 _object removeWeapon "2A42";
		 _object removeWeapon "AGS17";
		 _object removeWeapon "AT5LauncherSingle";	
	 };	 	 
} forEach vehicles;