params ['_vehiclesList'];

{
	_teamNumber = [_x] call WRC_fnc_getTeamNumber;
	[_teamNumber, 'startServerTime', serverTime] call WRC_fnc_setValueToTeam;
} forEach _vehiclesList;