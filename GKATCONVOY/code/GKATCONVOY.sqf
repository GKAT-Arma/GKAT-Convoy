/*
GKAT CONVOY
By GKAT Adam with help from
Crito @Vanaheim Gaming Servers
https://discord.gg/zWTAuanm5Q
*/
if (!isServer) exitWith {};

private ["_GKCGroupCenter","_GKCGroup","_GKCroads","_GKCspawnConvoyLocation","_GKCSpawnPoints","_GKCConvoyDetails","_GKCSelectConvoy","_GKCConvoySelected","_GKCplayerdistancecheck","_GKCplayerClose","_GKCplayerdistance","_GKCnearplayercount","_GKCVehicleArray","_GKCWalkingtroops","_GKCMarkerColor","_GKCMarkerText","_GKCConvoySpeed","_GKCMoney","_GKCRep","_GKCWalking","_GKCWalkingTotal","_GKCConvoyArray","_GKCLimitConvoyType","_GKCConvoyCheck","_markerremoved","_GKCMarker"];

_GKCSelectConvoy = selectRandom GKC_Convoy;
_GKCConvoySelected = _GKCSelectConvoy select 0;
_GKCConvoyDetails = _GKCSelectConvoy select 1;

_GKCroads = [0,0,0] nearRoads 50000;
_GKCspawnConvoyLocation = getPos (selectRandom _GKCroads);
_GKCSpawnPoints = _GKCspawnConvoyLocation nearRoads GKCSpawnRadius;
_GKCLimitConvoyType = GKCLimitConvoyType;

_GKCGroupCenter = createCenter GKCAISide;
_GKCGroup = createGroup [GKCAISide,true];
_GKCGroup deleteGroupWhenEmpty true;
_GKCConvoyCheck = false;

if (_GKCLimitConvoyType) then
	{
		if (_GKCConvoySelected in GKC_liveConvoysArray) exitWith
		{
			diag_log format["Convoy %1 already spawned", _GKCConvoySelected];
			_GKCConvoyCheck	= true;
		};

	};
if (_GKCConvoyCheck) exitWith
	{
		diag_log "Repicking new convoy";
	};
GKC_liveConvoysArray pushback _GKCConvoySelected;	
_GKCplayerdistancecheck = getPos (selectRandom _GKCSpawnPoints);

_GKCplayerClose = [];
	{
		_GKCplayerdistance = _x distance _GKCplayerdistancecheck;
		if (_GKCplayerdistance < GKCPlayerDistance) then
			{
			_GKCplayerClose pushback _x;
			};
	}forEach allPlayers;
_GKCnearplayercount = count _GKCplayerClose;

if (_GKCnearplayercount > 0) exitWith
		{
			diag_log "Player too close to convoy spawn, repicking new location";
		};
		
_markerremoved = false;
/////////////////////////////////////////		
//Post Config Checks, Begin Convoy Spawn//		
/////////////////////////////////////////

if (getMarkerType "GKATConvoy" == "") then
	{
	_markerremoved = true;
	};

if (_markerremoved) exitWith
{
["toastRequest", ["SuccessTitleAndText", ["Replace Vanaheim Marker or Convoy won't work!", "Visit Vanaheim Exile Arma Server"]]] call ExileServer_system_network_send_broadcast;
};

_GKCMarkerColor = _GKCConvoyDetails select 0;
_GKCMarkerText = _GKCConvoyDetails select 1;
_GKCConvoySpeed = _GKCConvoyDetails select 2;
_GKCMoney = _GKCConvoyDetails select 3;
_GKCRep = _GKCConvoyDetails select 4;
_GKCWalking = _GKCConvoyDetails select 5;
_GKCWalkingTotal = _GKCConvoyDetails select 6;
_GKCConvoyArray = _GKCConvoyDetails select 7;
format ["A %1 has been spotted in the region", _GKCMarkerText] remoteExecCall ["systemChat",-2];
_GKCVehicleArray = [];
_GKCVehicleArray = [_GKCGroup,_GKCSpawnPoints,_GKCConvoySpeed,_GKCMoney,_GKCRep,_GKCWalking,_GKCConvoyArray] call GKATCONVOYVehicleSpawn;

if (_GKCWalking) then
{
	_GKCWalkingtroops = [_GKCGroup,_GKCWalkingTotal,_GKCVehicleArray] call GKATCONVOYWalkers;
	[_GKCGroup,_GKCVehicleArray,_GKCWalking,_GKCWalkingtroops,_GKCConvoySelected,_GKCVehicleArray,_GKCMarkerText] spawn GKATCONVOYAliveCheck;
	[_GKCVehicleArray,_GKCGroup,_GKCWalking,_GKCWalkingtroops] spawn GKATCONVOYWaypointController;
	[_GKCVehicleArray,_GKCWalking,_GKCWalkingtroops,_GKCSpawnPoints] spawn GKATCONVOYStuckChecker;
}
else
{
	[_GKCGroup,_GKCVehicleArray,_GKCWalking, _GKCConvoySelected,_GKCVehicleArray,_GKCMarkerText] spawn GKATCONVOYAliveCheck;
	[_GKCVehicleArray,_GKCGroup,_GKCWalking] spawn GKATCONVOYWaypointController;
	[_GKCVehicleArray,_GKCWalking,_GKCSpawnPoints] spawn GKATCONVOYStuckChecker;
};

[_GKCVehicleArray,_GKCMarkerColor,_GKCMarkerText] spawn GKATCONVOYMarker;





