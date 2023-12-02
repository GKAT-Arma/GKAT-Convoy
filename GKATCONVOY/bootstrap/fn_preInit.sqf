/*
GKAT CONVOY
By GKAT Adam with help from
Crito @Vanaheim Gaming Servers
https://discord.gg/zWTAuanm5Q
*/
 
private["_code"];

{
    _code = compileFinal (preprocessFileLineNumbers (_x select 1));
    missionNamespace setVariable [(_x select 0), _code];
}
forEach
[
	['GKATCONVOYStart','GKATCONVOY\code\GKATCONVOYStart.sqf'],
	['GKATCONVOY','GKATCONVOY\code\GKATCONVOY.sqf'],
	['GKATCONVOYLogging','GKATCONVOY\code\GKATCONVOYLogging.sqf'],
	['GKATCONVOYVehicleSpawn','GKATCONVOY\code\GKATCONVOYVehicleSpawn.sqf'],
	['GKATCONVOYRespectPayout','GKATCONVOY\code\GKATCONVOYRespectPayout.sqf'],
	['GKATCONVOYRespectPayoutWalker','GKATCONVOY\code\GKATCONVOYRespectPayoutWalker.sqf'],
	['GKATCONVOYMoneyPayout','GKATCONVOY\code\GKATCONVOYMoneyPayout.sqf'],
	['GKATCONVOYWalkers','GKATCONVOY\code\GKATCONVOYWalkers.sqf'],
	['GKATCONVOYWaypointController','GKATCONVOY\code\GKATCONVOYWaypointController.sqf'],
	['GKATCONVOYAliveCheck','GKATCONVOY\code\GKATCONVOYAliveCheck.sqf'],
	['GKATCONVOYMarker','GKATCONVOY\code\GKATCONVOYMarker.sqf'],
	['GKATCONVOYPlayerCount','GKATCONVOY\code\GKATCONVOYPlayerCount.sqf'],
	['GKATCONVOYStuckChecker','GKATCONVOY\code\GKATCONVOYStuckChecker.sqf']
];

"PreInit finished" call GKATCONVOYLogging;