[] spawn {
	disableSerialization;
	DS_really_loud_sounds = {[60,15] call fnc_usec_pitchWhine;for "_i" from 1 to 15 do {playSound format ["%1",_this select 0];};};
	DS_double_cut = {1 cutText [format ["%1",_this select 0],"PLAIN DOWN"];2 cutText [format ["%1",_this select 0],"PLAIN"];};
	while {true} do {
		waitUntil {sleep 1;((!isNull findDisplay 63) && (!isNull findDisplay 55))};
		if (ctrlText ((findDisplay 55) displayCtrl 101) == "\ca\ui\textures\mikrak.paa") then {
			if (ctrlText ((findDisplay 63) displayCtrl 101) == localize "STR_SIDE_CHANNEL") then {
				[] spawn {
					if (isNil "reset_timer") then {
						reset_timer = true;
						sleep 90;
						disconnect_me = nil;
						warn_one = nil;
						warn_last = nil;
						reset_timer = nil;
					};
				};
				if (isNil "disconnect_me") then {disconnect_me = 0;} else {disconnect_me = disconnect_me + 1;};
				if (disconnect_me == 0) then {
					if (isNil "warn_one") then {
						warn_one = true;
						systemChat ("DO NOT USE VOICE OVER SIDE CHAT, THIS IS YOUR ONLY WARNING!");
						["beat04"] spawn DS_really_loud_sounds;
						["NO VOICE ON SIDE"] spawn DS_double_cut;
					};
				};
				if (disconnect_me >= 2) then {
					if (isNil "warn_last") then {
						warn_last = true;
						playMusic ["PitchWhine",0];
						["beat04"] spawn DS_really_loud_sounds;
						["You were warned..."] spawn DS_double_cut;
						sleep 0.5;
						1 fademusic 10;
						1 fadesound 10;
						player setDamage 1;
						};
				};
			};
		};
		sleep 1;
	};
};