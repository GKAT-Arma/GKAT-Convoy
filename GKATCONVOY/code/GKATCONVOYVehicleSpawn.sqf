/*
GKAT CONVOY
By GKAT Adam with help from
Crito @Vanaheim Gaming Servers
https://discord.gg/zWTAuanm5Q
*/

if (!isServer) exitWith {};

Params ["_GKCGroup","_GKCSpawnPoints","_GKCConvoySpeed","_GKCMoney","_GKCRep","_GKCWalking","_GKCConvoyArray"];
private ["_GKCMoney","_GKCRep","_GKCspawnVehiclePos","_GKCspawnVehicleLoc","_GKCindexVehSpawn","_GKCVehicle","_GKCVehicleArray"];

_GKCspawnVehiclePos = "";
_GKCVehicleArray = [];
{
	_GKCspawnVehicleLoc = selectRandom _GKCSpawnPoints;
	_GKCindexVehSpawn = _GKCSpawnPoints find _GKCspawnVehicleLoc;
	_GKCspawnVehiclePos = getPosATL _GKCspawnVehicleLoc;
	_GKCSpawnPoints deleteAt _GKCindexVehSpawn;
	_GKCVehicle = createVehicle [_x, _GKCspawnVehiclePos, [], 0, "NONE"];
	clearWeaponCargoGlobal _GKCVehicle;
	clearMagazineCargoGlobal _GKCVehicle;
	clearItemCargoGlobal _GKCVehicle;
	if !(GKCPersistentVehicle) then
	{
		_GKCVehicle setVariable ["ExileIsPersistent", false];
	};
	
	if (_GKCWalking) then
		{
			_GKCVehicle limitSpeed 15;
		}
	else
		{
			_GKCVehicle limitSpeed _GKCConvoySpeed;
		};
	_GKCVehicle engineOn true;
	_GKCVehicle setFuel 1;
	_GKCVehicle setVehicleAmmo 1;
	if (GKCConvoyKillMoney) then
		{
		_GKCVehicle setVariable ["GKAT_Convoy_Money",_GKCMoney];
		_GKCVehicle addMPEventHandler ["MPKilled",'if (isServer) then { _this call GKATCONVOYMoneyPayout; }; '];
		}
		else
		{
		_GKCVehicle setVariable ["ExileMoney", _GKCMoney, true];
		};
	if (GKCConvoyKillRep) then
		{
		_GKCVehicle setVariable ["GKAT_Convoy_Respect",_GKCRep];
		_GKCVehicle addMPEventHandler ["MPKilled",'if (isServer) then { _this call GKATCONVOYRespectPayout; }; '];
		};
	_GKCGroup createVehicleCrew _GKCVehicle;
	_GKCGroup addVehicle _GKCVehicle;
_GKCVehicleArray pushBack _GKCVehicle;
_GKCVehicle setConvoySeparation 20;
}forEach _GKCConvoyArray;

{
_x addEventHandler ["GetIn", {_GKCVehicleArray deleteAt _forEachIndex;}];
}forEach _GKCVehicleArray;

_GKCVehicleArray






