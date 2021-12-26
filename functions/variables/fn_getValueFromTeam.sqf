params ['_teamNumber', '_variableName'];

_teamVariableName = [_teamNumber] call WRC_fnc_getTeamVariableName;

_teamValue = missionNamespace getVariable _teamVariableName;

_teamValue get _variableName;
