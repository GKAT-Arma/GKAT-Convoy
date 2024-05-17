/*
GKAT CONVOY
By GKAT Adam with help from
Crito @Vanaheim Gaming Servers
https://discord.gg/zWTAuanm5Q
*/

private ["_GKCVictim","_GKCInstigator","_InstigatorUID","_GKCKillerRespect","_GKCKillMSG1","_GKCKillMSG2","_GKCKillMSG1","_PayIncrease","_KillerPay"];

_GKCvictim = _this select 0;
_GKCInstigator = _this select 2;
_InstigatorUID = getPlayerUID _GKCInstigator;

if ((!isNull _GKCInstigator) && (isplayer _GKCInstigator)) then
	{
		_GKCRepIncrease = 500;
		_GKCKillerRespect = _GKCInstigator getVariable ["ExileScore", 0];
		_GKCKillMSG1 = [[format ["AI Killed!"],_GKCRepIncrease]];
		_GKCKillerRespect = _GKCKillerRespect + _GKCRepIncrease;
		_GKCInstigator setVariable ["ExileScore",_GKCKillerRespect];
		[_GKCInstigator, "showFragRequest", [_GKCKillMSG1]] call ExileServer_system_network_send_to;
		format["setAccountScore:%1:%2", _GKCKillerRespect, _InstigatorUID] call ExileServer_system_database_query_fireAndForget;
		ExileClientPlayerScore = _GKCKillerRespect;
		(owner _GKCInstigator) publicVariableClient "ExileClientPlayerScore";
		ExileClientPlayerScore = nil;
	};