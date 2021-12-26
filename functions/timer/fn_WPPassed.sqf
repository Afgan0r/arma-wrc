params ['_trigger', '_vehiclesList'];

_waypointNumber = [_trigger] call WRC_fnc_getWPNumber;
_sectorNumber = [_waypointNumber] call WRC_fnc_getSectorNumber;

{
	_teamNumber = [_x] call WRC_fnc_getTeamNumber;
	_lastWPNumber = [_teamNumber, 'lastWPNumber'] call WRC_fnc_getValueFromTeam;

	if (_waypointNumber - _lastWPNumber > 1) exitWith {
		{
			['Предыдущий чекпоинт не пройден'] remoteExec ['hint', _x];
			[WRC_fnc_playWrongCheckpoint] remoteExec ['call', _x];
		} forEach crew _x;
	};

	if (_waypointNumber - _lastWPNumber < 1) exitWith {
		{
			['Чекпоинт уже пойден'] remoteExec ['hint', _x];
			[WRC_fnc_playWrongCheckpoint] remoteExec ['call', _x];
		} forEach crew _x;
	};

	{
		[WRC_fnc_playCheckpointPassed] remoteExec ['call', _x];
	} forEach crew _x;

	[_teamNumber, 'lastWPNumber', _waypointNumber] call WRC_fnc_setValueToTeam;

	if (_sectorNumber == 1) then {
		_startServerTime = [_teamNumber, 'startServerTime'] call WRC_fnc_getValueFromTeam;
		[_teamNumber, 'firstSectorTime', serverTime - _startServerTime] call WRC_fnc_setValueToTeam;
	};

	if (_sectorNumber == 2) then {
		_startServerTime = [_teamNumber, 'startServerTime'] call WRC_fnc_getValueFromTeam;
		[_teamNumber, 'secondSectorTime', serverTime - _startServerTime] call WRC_fnc_setValueToTeam;
	};
} forEach _vehiclesList;
