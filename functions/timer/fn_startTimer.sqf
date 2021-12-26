params ['_vehiclesList'];

{
	_teamNumber = [_x] call WRC_fnc_getTeamNumber;
	[_teamNumber, 'startServerTime', serverTime] call WRC_fnc_setValueToTeam;
	[_teamNumber, 'lastWPNumber', 0] call WRC_fnc_setValueToTeam;

		{
		[{ call WRC_fnc_playCheckpointPassed; }] remoteExec ['call', _x];
	} forEach crew _x;
} forEach _vehiclesList;
