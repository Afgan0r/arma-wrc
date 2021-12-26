params ['_teamNumber', '_variableName', '_value'];

_teamVariableName = [_teamNumber] call WRC_fnc_getTeamVariableName;

_teamValue = profileNamespace getVariable _teamVariableName;

if (isNil { _teamValue }) then {
	_teamValue = [_teamVariableName] call WRC_fnc_initializeTeamValues;
};

_teamValue set [_variableName, _value];

profileNamespace setVariable [_teamVariableName, _teamValue];
saveProfileNamespace;
