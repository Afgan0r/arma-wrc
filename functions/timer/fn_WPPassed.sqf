params ['_trigger', '_vehiclesList'];

_waypointNumber = [_trigger] call WRC_fnc_getWPNumber;
_sectorNumber = [_waypointNumber] call WRC_fnc_getSectorNumber;

{
	_car = _x;
	_teamNumber = [_car] call WRC_fnc_getTeamNumber;
	_lastWPNumber = [_teamNumber, 'lastWPNumber'] call WRC_fnc_getValueFromTeam;

	if (_waypointNumber - _lastWPNumber > 1) exitWith {
		{
			[{
				hint 'Предыдущий чекпоинт не пройден';
				call WRC_fnc_playWrongCheckpoint;
			}] remoteExec ['call', _x];
		} forEach crew _car;
	};

	if (_waypointNumber - _lastWPNumber < 1) exitWith {
		{
			[{
				hint 'Предыдущий чекпоинт не пройден';
				call WRC_fnc_playWrongCheckpoint;
			}] remoteExec ['call', _x];
		} forEach crew _car;
	};

	[_teamNumber, 'lastWPNumber', _waypointNumber] call WRC_fnc_setValueToTeam;

	diag_log ['WRC_LOG_passed', _trigger, _waypointNumber, _sectorNumber, _teamNumber, _lastWPNumber];

	if (_sectorNumber == 1) then {
		_startServerTime = [_teamNumber, 'startServerTime'] call WRC_fnc_getValueFromTeam;
		[_teamNumber, 'firstSectorTime', serverTime - _startServerTime] call WRC_fnc_setValueToTeam;
	};

	if (_sectorNumber == 2) then {
		_startServerTime = [_teamNumber, 'startServerTime'] call WRC_fnc_getValueFromTeam;
		[_teamNumber, 'secondSectorTime', serverTime - _startServerTime] call WRC_fnc_setValueToTeam;
	};

	{
		remoteExec ['WRC_fnc_playCheckpointPassed', _x];
		[_trigger] remoteExec ['WRC_fnc_deleteLocalMarker', _x];
		[_waypointNumber] remoteExec ['WRC_fnc_createNextMarker', _x];
	} forEach crew _car;
} forEach _vehiclesList;
