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
		_PayIncrease = _GKCVictim getVariable "GKAT_Convoy_Money";
		_KillerPay = _GKCInstigator getVariable ["ExileMoney", 0];
		_KillerPay = _KillerPay + _PayIncrease;
		_GKCInstigator setVariable ["ExileMoney",_KillerPay, true];
		_GKCKillMSG2 = [[format ["Vehicle Destroyed!"],_PayIncrease]];
		[_GKCInstigator, "showFragRequest", [_GKCKillMSG2]] call ExileServer_system_network_send_to;

	};