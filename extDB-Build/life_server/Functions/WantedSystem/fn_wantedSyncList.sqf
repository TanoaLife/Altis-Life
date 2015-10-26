#include "\life_server\script_macros.hpp"
/*
    wantedSyncList.sqf
    Written by: Derek Benson
    Loads the server wanted list into serverside variable "wantedList"
*/


private["_query","_queryResult","_units","_wanted"];
if (isNil "life_wantedsync") then {life_wantedsync = 0;};
if (life_wantedsync > time) exitWith {};
life_wantedsync = time + 10;
sleep 10;

diag_log "------------- Called wantedSyncList -------------";

//while {true} do {
    _units = [];

    {if((side _x) == civilian) then {_units pushBack (getPlayerUID _x)};} foreach playableUnits;


    _wanted = [];
    {
    	_query = format["wantedSyncTable:%1",_x];
        _queryResult = [_query,2] call DB_fnc_asyncCall;

        /*["diag_log",[
    		"------------- Wanted Sync Table Request -------------",
    		format["QUERY: %1",_query],
    		format["Result: %1",_queryResult],
    		"------------------------------------------------"
    	]] call TON_fnc_logIt;*/

        if (!(EQUAL(_queryResult,[]))) then {
    	    _wanted pushBack _queryResult;
        };
    } forEach _units;


    missionNamespace setVariable ["wantedList", _wanted];
    publicVariable "wantedList";
//    sleep (30);
//};
/*missionNamespace setVariable ["wantedListUpdated", true];

sleep 30;

missionNamespace setVariable ["wantedListUpdated", false];
*/
