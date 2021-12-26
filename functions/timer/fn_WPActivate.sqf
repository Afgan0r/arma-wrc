params ['_trigger', '_vehiclesList'];

_triggerName = str _trigger;

_isStart = _triggerName == 'start';
_isFinish = _triggerName == 'finish';

diag_log format [
	"RALLY_LOG: wp_name: %1, start: %2, middle: %3, finish: %4",
	_triggerName, _isStart, !(_isStart || _isFinish), _isFinish
];

if (_isStart) then {
	[_vehiclesList] call WRC_fnc_startTimer;
};

if (!(_isStart || _isFinish)) then {
	[_trigger, _vehiclesList] call WRC_fnc_WPPassed;
};

if (_isFinish) then {
	[_vehiclesList] call WRC_fnc_finishTimer;
}
