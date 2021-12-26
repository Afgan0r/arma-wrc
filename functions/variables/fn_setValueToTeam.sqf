params ['_teamNumber', '_variableName', '_value'];

_teamVariableName = [_teamNumber] call WRC_fnc_getTeamVariableName;

_teamValue = missionNamespace getVariable _teamVariableName;

if (isNil { _teamValue }) then {
	_teamValue = [_teamVariableName] call WRC_fnc_initializeTeamValues;
};

_teamValue set [_variableName, _value];

missionNamespace setVariable [_teamVariableName, _teamValue, true];
