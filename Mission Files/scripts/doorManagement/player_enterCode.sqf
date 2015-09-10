AllowManualCode = true;// 2 reason| 1: Allows breaking codes (if 2nd config = false and code = 3 digits) | 2: Friends can access access not owned doors until owner gets on.
HarderPenalty = true;// Cen's Penalty: Flashes screen white. And kicks player to lobby if failed more then (random number between 4 and 14) times.
// AllowUncrackableCode = false; // in next release: if set to true, player can change code to more then 4 digits, The manualCode will always fail when he does. THIS is for AntiCodeCrack servers that allow Manual Code for people that like that system.
// in next release. AllowManualCode will allow players to change the code in the DoorManagement Menu.

if(AllowManualCode)then{
_display = findDisplay 51144;
_display closeDisplay 1;
DZE_Lock_Door != (this getvariable['CharacterID','0']);
DZE_topCombo = 0;	
DZE_midCombo = 0;
DZE_botCombo = 0;
createDialog "Entercode";
}else{
cutText ["We do not allow manual codes.","PLAIN DOWN"];
};