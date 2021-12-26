params ['_vehiclesList', '_waypointNumber'];

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
