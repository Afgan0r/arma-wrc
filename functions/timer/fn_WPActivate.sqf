params ['_trigger', '_vehiclesList'];

_triggerName = str _trigger;

_isStart = _triggerName == 'start';
_isFinish = _triggerName == 'finish';

diag_log ['WRC_LOG', _triggerName, _vehiclesList];

if (_isStart) then {
	[_vehiclesList] call WRC_fnc_startTimer;
};

if (!(_isStart || _isFinish)) then {
	[_trigger, _vehiclesList] call WRC_fnc_WPPassed;
};

if (_isFinish) then {
	[_vehiclesList] call WRC_fnc_finishTimer;
}
