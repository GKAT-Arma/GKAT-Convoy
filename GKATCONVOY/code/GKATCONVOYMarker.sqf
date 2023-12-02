/*
GKAT CONVOY
By GKAT Adam with help from
Crito @Vanaheim Gaming Servers
https://discord.gg/zWTAuanm5Q
*/

if (!isServer) exitWith {};

private ["_GKCMarkerIcon","_GKCLeadVehicle","_GKCLeaderPos","_GKCMarkerOffset","_GKCMarkerArea","_Markercount1","_Markername1","_Markercount2","_Markername2"];

_GKCVehicleArray = _this select 0;
_GKCMarkerColor = _this select 1;
_GKCMarkerText = _this select 2;
GKCMarker = GKCMarker +1;
_Markercount1 = GKCMarker;
_Markername1 = str _Markercount1;
_Markercount2 = GKCMarker + 0.5;
_Markername2 = str _Markercount2;
if (GKCConvoyLocation) then
{ 
	_GKCLeadVehicle = _GKCVehicleArray select 0;
	_GKCLeaderPos = getPos _GKCLeadVehicle;
	_GKCMarkerOffset = _GKCLeaderPos getPos [GKCMarkerOffset, random 360];	
	_GKCMarkerIcon = createMarker [_Markername1,_GKCMarkerOffset];
	_GKCMarkerIcon setMarkerType GKCConvoyMarker;
	_GKCMarkerIcon setMarkerColor _GKCMarkerColor;
	_GKCMarkerIcon setMarkerText _GKCMarkerText;
	
	_GKCMarkerArea = createMarker [_Markername2,_GKCMarkerOffset];
	_GKCMarkerArea setMarkerColor _GKCMarkerColor;
	_GKCMarkerArea setMarkerShape "ELLIPSE";
	_GKCMarkerArea setMarkerBrush "Solid";
	_GKCMarkerArea setMarkerSize [GKCMarkerRadius,GKCMarkerRadius];
	_GKCMarkerArea setMarkerAlpha 0.4;
	
	While {!(_GKCVehicleArray isEqualTo [])} do
		{
			_GKCLeadVehicle = _GKCVehicleArray select 0;
			_GKCLeaderPos = getPos _GKCLeadVehicle;
			_GKCMarkerOffset = _GKCLeaderPos getPos [GKCMarkerOffset, random 360];
			_Markername1 setMarkerPos _GKCMarkerOffset;
			_Markername2 setMarkerPos _GKCMarkerOffset;
			Sleep GKCConvoyTimer;
		};
	if (_GKCVehicleArray isEqualTo []) then
		{
		deleteMarker _Markername1;
		deleteMarker _Markername2;
		};
};






