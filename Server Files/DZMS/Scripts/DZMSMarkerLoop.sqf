/*
	Marker Resetter by Vampire
	Marker Resetter checks if a Mission is running and resets the marker for JIPs
*/
private["_run","_nul","_nil"];

diag_log text format ["[DZMS]: Mission Marker Loop for JIPs Starting!"];

//Lets define these
if (isNil "DZMSMajCoords")then{DZMSMajCoords = [0,0,0];};
if (isNil "DZMSMinCoords")then{DZMSMinCoords = [0,0,0];};

//Lets start the timer
_run = true;
while {_run} do
{
    [25,5] call DZMSSleep; // sleep 25 seconds
	//If the marker exists (meaning the mission is active) lets delete it and re-add it
	if (!(getMarkerColor "DZMSMajMarker" == "")) then {
		deleteMarker "DZMSMajMarker";
		deleteMarker "DZMSMajDot";
		//Re-Add the markers
		_nul = createMarker ["DZMSMajMarker", DZMSMajCoords];
		"DZMSMajMarker" setMarkerColor "ColorBlue";
		"DZMSMajMarker" setMarkerShape "ELLIPSE";
		"DZMSMajMarker" setMarkerBrush "Solid";
		"DZMSMajMarker" setMarkerSize [225,225];
		_zap = createMarker ["DZMSMajDot", DZMSMajCoords];
		"DZMSMajDot" setMarkerColor "ColorBlack";
		"DZMSMajDot" setMarkerType "Vehicle";
		"DZMSMajDot" setMarkerText DZMSMajName;
	};
	//Lets do the same for the minor mission
	if (!(getMarkerColor "DZMSMinMarker" == "")) then {
		deleteMarker "DZMSMinMarker";
		deleteMarker "DZMSMinDot";
		//Re-Add the markers
		_nil = createMarker ["DZMSMinMarker", DZMSMinCoords];
		"DZMSMinMarker" setMarkerColor "ColorGreen";
		"DZMSMinMarker" setMarkerShape "ELLIPSE";
		"DZMSMinMarker" setMarkerBrush "Solid";
		"DZMSMinMarker" setMarkerSize [190,190];
		_zip = createMarker ["DZMSMinDot", DZMSMinCoords];
		"DZMSMinDot" setMarkerColor "ColorBlack";
		"DZMSMinDot" setMarkerType "Vehicle";
		"DZMSMinDot" setMarkerText DZMSMinName;
	};
	//Now we wait another 25 seconds
};