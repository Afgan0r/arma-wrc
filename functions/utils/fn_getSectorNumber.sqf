params ['_waypointNumber'];

private '_result';

_sectors = ['_sectorsWP'] call WRC_fnc_getSettingValue;
_index = _sectors find _waypointNumber;

if (_index >= 0) then {
	_result = _index + 1;
};

_result;
