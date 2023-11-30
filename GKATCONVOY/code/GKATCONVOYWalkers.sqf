/*
GKAT CONVOY
By GKAT Adam with help from
Crito @Vanaheim Gaming Servers
https://discord.gg/zWTAuanm5Q
*/

if (!isServer) exitWith {};

Params ["_GKCGroup","_GKCWalkingTotal","_GKCVehicleArray"];
private ["_GKCUnitPos","_GKCunit","_GKCClass","_GKCLeadVehicle"];

_GKCLeadVehicle = _GKCVehicleArray select 0;

_GKCWalkingtroops = [];
for "_i" from 1 to _GKCWalkingTotal do
{
	_GKCUnitPos = _GKCLeadVehicle getPos [20, random 360];
	_GKCClass = selectRandom GKC_Walkers;
	_GKCunit = _GKCGroup createUnit [_GKCClass, _GKCUnitPos, [], 0, "NONE"];
	_GKCunit setUnitPos "UP";
	_GKCunit setSkill ["aimingAccuracy", 0.50];
	_GKCunit setSkill ["aimingShake", 0.50];
	_GKCunit setSkill ["aimingSpeed", 0.50];
	_GKCunit setSkill ["endurance", 1.00];
	_GKCunit setSkill ["spotDistance", 0.50];
	_GKCunit setSkill ["spotTime", 0.50];
	_GKCunit setSkill ["courage", 1.00];
	_GKCunit setSkill ["reloadSpeed", 1.00];
	_GKCunit setSkill ["commanding", 1.00];
	_GKCunit setSkill ["general", 0.60];
	_GKCunit addMPEventHandler ["MPKilled",'if (isServer) then { _this call GKATCONVOYRespectPayoutWalker; }; '];
	[_GKCunit] joinSilent _GKCGroup;
	_GKCWalkingtroops pushback _GKCunit;
};
_GKCWalkingtroops




