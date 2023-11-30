/*
GKAT CONVOY
By GKAT Adam with help from
Crito @Vanaheim Gaming Servers
https://discord.gg/zWTAuanm5Q
*/

if (!isServer) exitWith {};

private ["_GKCLeadVehicle","_GKCDriverLead","_GKCLeadVehiclePos","_GKCTotal","_GKCVehicleArray","_GKCGroup","_GKCWalking","_GKCWalkingtroops","_GKCConvoySelected","_GKCMarkerText"];

if (_this select 2) then
	{
		_GKCGroup = _this select 0;
		_GKCVehicleArray = _this select 1;
		_GKCWalking = _this select 2;
		_GKCWalkingtroops = _this select 3;
		_GKCConvoySelected = _this select 4;
		_GKCVehicleArray = _this select 5;
		_GKCMarkerText = _this select 6;
	}
	else
	{
		_GKCGroup = _this select 0;
		_GKCVehicleArray = _this select 1;
		_GKCWalking = _this select 2;
		_GKCConvoySelected = _this select 3;
		_GKCVehicleArray = _this select 4;
		_GKCMarkerText = _this select 5;
	};
_GKCDriverLead = "";
_GKCLeadVehiclePos = [];
While {isServer} do
	{
		sleep 15;
			_GKCTotal = ((count _GKCVehicleArray) -1);
			_GKCLeadVehicle = _GKCVehicleArray select 0;
			_GKCDriverLead = driver _GKCLeadVehicle;
			_GKCGroup selectLeader _GKCDriverLead;
			_GKCLeadVehiclePos = getPos _GKCLeadVehicle;
			for "_i" from 1 to _GKCTotal do
			{
				driver (_GKCVehicleArray select _i) doFollow _GKCDriverLead;
				driver (_GKCVehicleArray select _i) doMove _GKCLeadVehiclePos;
			};
			if (_GKCWalking) then	
			{
				{
					_x doFollow _GKCDriverLead;
					_x doMove _GKCLeadVehiclePos;
				}forEach _GKCWalkingtroops;
			};

		{
			if ((count crew _x < 1) || (!alive (driver _x)) || (isNull _x) || !(alive _x)) then
				{
					_GKCVehicleArray deleteAt _forEachIndex;
				};
		}forEach _GKCVehicleArray;
		
		if (_GKCVehicleArray isEqualTo []) exitWith 
		{
			["toastRequest", ["SuccessTitleAndText", ["Convoy Ended!", format ["%1", _GKCMarkerText]]]] call ExileServer_system_network_send_broadcast;

			GKC_liveConvoysArray deleteAt (GKC_liveConvoysArray find _GKCConvoySelected);
			{
				deleteVehicleCrew _x;
			}forEach _GKCVehicleArray;
			
			if (_GKCWalking) then	
			{
				{
				deleteVehicle _x;
				}forEach _GKCWalkingtroops;
			};
		};
	};







