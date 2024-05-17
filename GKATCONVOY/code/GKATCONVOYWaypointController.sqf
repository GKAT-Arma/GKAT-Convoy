/*
GKAT CONVOY
By GKAT Adam with help from
Crito @Vanaheim Gaming Servers
https://discord.gg/zWTAuanm5Q
*/

if (!isServer) exitWith {};

private ["_FinalDistance","_GKCLeadVehicle","_GKCGroup","_GKCVehicleArray","_DestinationRoadPos","_possibledestination","_GKCWalking","_GKCWalkingtroops","_GKCWP1","_GKCWP2","_CurrentLeadVehiclePos","_GKCgoodPos","_GKCgoodPosDist","_allRoads","_GKCCurrentLeadVehicle","_LeadVehiclePos","_GKCplayerClose","_GKCplayerdistance"];


if (_this select 2) then
	{
	_GKCVehicleArray = _this select 0;
	_GKCGroup = _this select 1;
	_GKCWalking = _this select 2;
	_GKCWalkingtroops = _this select 3;
	}
	else
	{
	_GKCVehicleArray = _this select 0;
	_GKCGroup = _this select 1;
	_GKCWalking = _this select 2;
	};
	
_allRoads = [0,0,0] nearRoads 50000;
_DestinationRoadPos = [];
_possibledestination = [];
_GKCLeadVehicle = _GKCVehicleArray select 0;
_LeadVehiclePos = getPos _GKCLeadVehicle;
_GKCgoodPos = false;
			
while {!_GKCgoodPos} do
{
	Sleep 0.1;
	_GKCgoodPosDist = 0;
	while {_GKCgoodPosDist < 4000} do
	{
		Sleep 0.1;
		_possibledestination = getPos (selectRandom _allRoads);
		_GKCgoodPosDist = _LeadVehiclePos distance2D _possibledestination;
	};
	_GKCgoodPos = true;
};

while {(count (waypoints _GKCGroup)) > 0} do 
{
	deleteWaypoint ((waypoints _GKCGroup) #0);
};
_GKCCurrentLeadVehicle = _GKCVehicleArray select 0;
_CurrentLeadVehiclePos = getPos _GKCCurrentLeadVehicle;
_FinalDistance = 100;
While {!(_GKCVehicleArray isEqualTo [])} do
{
	Sleep 15;
		_GKCCurrentLeadVehicle = _GKCVehicleArray select 0;
		_CurrentLeadVehiclePos = getPos _GKCCurrentLeadVehicle;
		_GKCWP1 = _GKCGroup addWaypoint [_possibledestination, 1];
		_GKCWP1 setWaypointSpeed "FULL";
		_GKCWP1 setWaypointType "MOVE";
		_GKCWP1 setWaypointType "SAD";
		_GKCWP1 setWaypointCombatMode "RED";
		_GKCWP1 setWaypointSpeed "NORMAL";
		_GKCWP1 setWaypointBehaviour "AWARE";
		
		_GKCWP2 = _GKCGroup addWaypoint [_possibledestination, 1];
		_GKCWP2 setWaypointSpeed "FULL";
		_GKCWP2 setWaypointType "CYCLE";
		_GKCWP2 setWaypointType "SAD";
		_GKCWP2 setWaypointCombatMode "RED";
		_GKCWP2 setWaypointSpeed "NORMAL";
		_GKCWP2 setWaypointBehaviour "AWARE";
	
	if !(_GKCVehicleArray isEqualTo []) then
	{
		_FinalDistance = _CurrentLeadVehiclePos distance _possibledestination;
		if (_FinalDistance < 100) then
		{
		_GKCplayerClose = false;
			{
				_GKCplayerdistance = _x distance _CurrentLeadVehiclePos;
				if (_GKCplayerdistance < 500) then
					{
					_GKCplayerClose = true;
					};
			}forEach allPlayers;
		
		if (_GKCplayerClose) then
				{
					diag_log "Player close to convoy at end waypoint";
				}
				else
				{
					{
					
						deleteVehicleCrew _x;
						deleteVehicle _x;
						
					}forEach _GKCVehicleArray;
					
					if (_GKCWalking) then	
					{
						{
						deleteVehicle _x;
						}forEach _GKCWalkingtroops;
					};
				};
		};
	};

};
