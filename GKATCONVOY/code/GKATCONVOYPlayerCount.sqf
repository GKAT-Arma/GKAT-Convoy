/*
GKAT CONVOY
By GKAT Adam with help from
Crito @Vanaheim Gaming Servers
https://discord.gg/zWTAuanm5Q
*/

if (!isServer) exitWith {};

private ["_GKCTotalPlayers","_GKCTotalConvoys"];
			
while {isServer} do
{
	Sleep 60;
	_GKCTotalPlayers = count allPlayers;
	_GKCTotalConvoys = count GKC_ConvoySpawn;

	for "_i" from 0 to (_GKCTotalConvoys) -1 do
		{

			if (_GKCTotalPlayers >= ((GKC_ConvoySpawn select _i) select 0)) then
				{
				GKCMaxTempConvoy = ((GKC_ConvoySpawn select _i) select 1);
				if (GKCMaxTempConvoy != GKCMaxConvoy) then
					{
					GKCMaxConvoy = GKCMaxTempConvoy;
					};
				};
		};
};

