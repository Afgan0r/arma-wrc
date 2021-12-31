params ['_currWPNumber'];

_WPCount = ['WPCount'] call WRC_fnc_getSettingValue;

if (_currWPNumber == _WPCount) exitWith { [finish] call WRC_fnc_createLocalMarker; };

_nextWPTrigger = call compile format['wp_%1', _currWPNumber + 1];

[_nextWPTrigger] call WRC_fnc_createLocalMarker;
