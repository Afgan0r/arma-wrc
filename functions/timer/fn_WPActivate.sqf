params ['_trigger', '_vehiclesList'];

_triggerName = str _trigger;

_isStart = _triggerName == 'start';
_isFinish = _triggerName == 'finish';

diag_log format [
	"RALLY_LOG: wp_name: %1, start: %2, middle: %3, finish: %4",
	_triggerName, _isStart, !(_isStart || _isFinish), _isFinish
];

// TODO: refactor branches

if (_isStart) then {
	{
		_teamNumber = [_x] call WRC_fnc_getTeamNumber;
		[_teamNumber, 'startServerTime', serverTime] call WRC_fnc_setValueToTeam;
	} forEach _vehiclesList;
};

if (!(_isStart || _isFinish)) then {
	_waypointNumber = [_trigger] call WRC_fnc_getWPNumber;
	_sectorNumber = [_waypointNumber] call WRC_fnc_getSectorNumber;

	{
		_teamNumber = [_x] call WRC_fnc_getTeamNumber;
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
};

if (_isFinish) then {
	{
		_teamNumber = [_x] call WRC_fnc_getTeamNumber;
		_startServerTime = [_teamNumber, 'startServerTime'] call WRC_fnc_getValueFromTeam;
		[_teamNumber, 'finishServerTime', serverTime] call WRC_fnc_setValueToTeam;
		[_teamNumber, 'resultTime', serverTime - _startServerTime] call WRC_fnc_setValueToTeam;
	} forEach _vehiclesList;
}
