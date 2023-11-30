/*
GKAT CONVOY
By GKAT Adam with help from
Crito @Vanaheim Gaming Servers
https://discord.gg/zWTAuanm5Q
*/

if (!isServer) exitWith {};

call compile preprocessFileLineNumbers "GKATCONVOY\config.sqf";
	
GKC_liveConvoys				= 0;
GKC_liveConvoysArray   		= [];

publicVariable "GKC_liveConvoys";
publicVariable "GKC_liveConvoysArray";

missionNamespace setVariable [format ["LastConvoySpawnedAt"], 0];
	[30, GKATCONVOYStart, [], true] call ExileServer_system_thread_addtask;
"PostInit finished" call GKATCONVOYLogging;