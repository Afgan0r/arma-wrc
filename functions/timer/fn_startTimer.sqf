params ['_vehiclesList'];

{
	_teamNumber = [_x] call WRC_fnc_getTeamNumber;
	[_teamNumber, 'startServerTime', serverTime] call WRC_fnc_setValueToTeam;
	[_teamNumber, 'lastWPNumber', 0] call WRC_fnc_setValueToTeam;

	diag_log ['WRC_LOG_start', _teamNumber, _vehiclesList];

	{
		remoteExec ['WRC_fnc_playCheckpointPassed', _x];
		[start] remoteExec ['WRC_fnc_deleteLocalMarker', _x];
		[0] remoteExec ['WRC_fnc_createNextMarker', _x];
	} forEach crew _x;
} forEach _vehiclesList;
