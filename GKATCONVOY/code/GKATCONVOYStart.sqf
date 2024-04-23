/*
GKAT CONVOY
By GKAT Adam with help from
Crito @Vanaheim Gaming Servers
https://discord.gg/zWTAuanm5Q
*/

private["_GKCConvoySpawnedAt","_GKCSpawnTime","_GKClastSpawnedAt","_GKC_liveConvoysArray","_GKC_liveConvoys","_GKCMaxConvoy"];

GKC_liveConvoys = count(GKC_liveConvoysArray);

_GKC_liveConvoysArray = GKC_liveConvoysArray;
_GKC_liveConvoys = GKC_liveConvoys;
_GKCMaxConvoy = GKCMaxConvoy;

if (GKC_liveConvoys < GKCMaxConvoy) then
	{
		_GKCConvoySpawnedAt = format ["LastConvoySpawnedAt"];
		_GKCSpawnTime = GKCSpawnTime;
		_GKClastSpawnedAt = missionNamespace getVariable [_GKCConvoySpawnedAt, 0];

		if (time - _GKClastSpawnedAt >= _GKCSpawnTime) then
		{
			[] spawn GKATCONVOY;
			missionNamespace setVariable [_GKCConvoySpawnedAt, time];
		};
	};