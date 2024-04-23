/*
GKAT CONVOY
By GKAT Adam with help from
Crito @Vanaheim Gaming Servers
https://discord.gg/zWTAuanm5Q
*/

if (!isServer) exitWith {};

private ["_GKCVehicleArray","_GKCWalking","_GKCWalkingtroops","_CurrentLeadVehiclePos","_GKCCurrentLeadVehicle","_startpos","_GKCSpawnPoints","_StuckDistance","_GKCplayerClose"];


if (_this select 1) then
	{
	_GKCVehicleArray = _this select 0;
	_GKCWalking = _this select 1;
	_GKCWalkingtroops = _this select 2;
	_GKCSpawnPoints = _this select 3;
	}
	else
	{
	_GKCVehicleArray = _this select 0;
	_GKCWalking = _this select 1;
	_GKCSpawnPoints = _this select 2;
	};
	

_GKCCurrentLeadVehicle = _GKCVehicleArray select 0;
_startpos = getPos (selectRandom _GKCSpawnPoints);
_GKCplayerClose = false;
_CurrentLeadVehiclePos = [];

While {!(_GKCVehicleArray isEqualTo [])} do
{
	Sleep 200;
	if !(_GKCVehicleArray isEqualTo []) then
	{
	_GKCCurrentLeadVehicle = _GKCVehicleArray select 0;
	_CurrentLeadVehiclePos = getPos _GKCCurrentLeadVehicle;	
	
	_GKCplayerClose = false;
		{
			_GKCplayerdistance = _x distance _startpos;
			if (_GKCplayerdistance < 500) then
				{
				_GKCplayerClose = true;
				};
		}forEach allPlayers;
	
	if (_GKCplayerClose) exitWith
			{
				diag_log "Player close to stuck convoy, leaving for player to destroy";
			};

		_StuckDistance = _CurrentLeadVehiclePos distance _startpos;
		if (_StuckDistance < GKCSpawnRadius) exitWith
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
		if (_StuckDistance > GKCSpawnRadius) exitWith
			{
			diag_log "Convoy on the move, not stuck";	
			};
	};
};
