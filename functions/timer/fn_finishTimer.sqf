params ['_vehiclesList'];

{
	_teamNumber = [_x] call WRC_fnc_getTeamNumber;
	_startServerTime = [_teamNumber, 'startServerTime'] call WRC_fnc_getValueFromTeam;
	[_teamNumber, 'finishServerTime', serverTime] call WRC_fnc_setValueToTeam;
	[_teamNumber, 'resultTime', serverTime - _startServerTime] call WRC_fnc_setValueToTeam;

	diag_log ['WRC_LOG_finish', _teamNumber, _startServerTime, serverTime, serverTime - _startServerTime, _vehiclesList];

	{
		remoteExec ['WRC_fnc_playCheckpointPassed', _x];
		[finish] remoteExec ['WRC_fnc_deleteLocalMarker', _x];
	} forEach crew _x;
} forEach _vehiclesList;
