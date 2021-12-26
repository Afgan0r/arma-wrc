params ['_vehiclesList'];

{
	_teamNumber = [_x] call WRC_fnc_getTeamNumber;
	_startServerTime = [_teamNumber, 'startServerTime'] call WRC_fnc_getValueFromTeam;
	[_teamNumber, 'finishServerTime', serverTime] call WRC_fnc_setValueToTeam;
	[_teamNumber, 'resultTime', serverTime - _startServerTime] call WRC_fnc_setValueToTeam;

		{
		[{ call WRC_fnc_playCheckpointPassed; }] remoteExec ['call', _x];
	} forEach crew _x;
} forEach _vehiclesList;
