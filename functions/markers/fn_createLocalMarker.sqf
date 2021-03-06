params ['_WPTrigger'];

private '_type';
private '_markerType';
private '_text';

_triggerName = str _WPTrigger;
if (_triggerName == 'start') then { _type = 'start'; };
if (_triggerName == 'finish') then { _type = 'finish'; };
if (_triggerName != 'start' && _triggerName != 'finish') then { _type = 'wp'; };

switch (_type) do {
	case 'start': {
		_markerType = 'mil_flag';
		_text = 'Start';
		break;
	};
	case 'finish': {
		_markerType = 'mil_flag';
		_text = 'Finish';
		break;
	};
	case 'wp': {
		_markerType = 'mil_circle';
		_WPNumber = [_WPTrigger] call WRC_fnc_getWPNumber;
		_text = format ['WP %1', _WPNumber];
		break;
	};
};

_marker = createMarkerLocal [[_WPTrigger] call WRC_fnc_getMarkerName, getPos _WPTrigger];
_marker setMarkerShapeLocal 'ICON';
_marker setMarkerTypeLocal _markerType;
_marker setMarkerColorLocal 'ColorRed';
_marker setMarkerTextLocal _text;
