/*
	file: fn_cleanupMessages.sqf
*/

private["_player","_query"];
_player = [_this,0,ObjNull,[objNull]] call BIS_fnc_param;

if(isNull _player) exitWith {};

_query = format["cleanupMessages:%1",getPlayerUID _player];

[_query,1] call DB_fnc_asyncCall;
