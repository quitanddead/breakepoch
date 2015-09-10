_onScreenTime = 6;

waitUntil {!isNil "dayz_animalCheck"};
sleep 4;

_role1 = "Welcome to";
_role1names = ["Ascent Gaming"];

_role2 = "Server Staff";
_role2names = ["Anarior - Owner", 
			   "NZBeast - Owner",
			   "Rabbit - Admin",
			   "McGiggins - Admin"];
			   
_role3 = "Mod Version";
_role3names = ["DayZ Epoch 1.0.5.1 - Napf"];

_role4 = "Server Mods";
_role4names = ["* Indestructible Metal/Cinder Bases<br />and Locked Vehicles at bases",
			   "* Plot and Door Management",
			   "* Advanced Build Snapping",
			   "* Deploy Bike",
			   "* Heli Evac",
			   "* Advanced Skin Changing",
			   "* Auto-Refuel+Repair",
			   "* Trader SafeZones/Anti-Theft",
			   "* Custom AI Missions",
			   "* Group Manager",
			   "* Vehicle Key Changer"];
			   
_role5 = "Server Rules";
_role5names = ["* NO basing in high loot areas",
			   "* NO stealing from trader areas",
			   "* NO camping or combat in trader areas",
			   "* NO towing or lifting locked vehicles from bases",
			   "* NO voice over side chat",
			   "* Base attacks are allowed, just don't be a dick about it",
			   "* Only ask for admin help if absolutely necessary!",
			   "* To get admin help ask in side chat or in TeamSpeak"];
			   
_role6 = "Website";
_role6names = ["ascentdayz.com"];

_role7 = "TeamSpeak";
_role7names = ["ts3.ascentdayz.com"];

_role8 = "Donation Kits";
_role8names = ["* Humanity",
			   "* Loadout Kits",
			   "* Food and Med Supplies",
			   "* Private Teamspeak Channel",
			   "<br /><br />Perks are for convenience or flavour only, not pay to win. Thank you to those who help with the costs of running of our server."];

{
	sleep 2;
	_memberFunction = _x select 0;
	_memberNames = _x select 1;
	_finalText = format ["<t size='0.9' color='#0096ff' align='left'>%1<br /></t>", _memberFunction];
	_finalText = _finalText + "<t size='0.5' color='#FFFFFF' align='left'>";
	{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
	_finalText = _finalText + "</t>";
	_onScreenTime + (((count _memberNames) - 1) * 0.5);
	[
		_finalText,
		[safezoneX + safezoneW - 0.8,0.45],
		[safezoneY + safezoneH - 0.8,0.7],
		_onScreenTime,
		0.5
	] spawn BIS_fnc_dynamicText;
	sleep (_onScreenTime);
} forEach [
	[_role1, _role1names],
	[_role2, _role2names],
	[_role3, _role3names],
	[_role4, _role4names],
	[_role5, _role5names],
	[_role6, _role6names],
	[_role7, _role7names],
	[_role8, _role8names]
];