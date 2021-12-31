_teamNumber = parseNumber (str player trim ['car_dn', 0]);
_car = call compile format['car_%1', _teamNumber];
diag_log ['oof', _teamNumber, _car];

_marker = createMarkerLocal [format['%1_%2_%3', _car, str player, clientOwner], [-999999, -999999]];
_marker setMarkerShapeLocal 'ICON';
_marker setMarkerTypeLocal 'mil_dot';
_marker setMarkerColorLocal 'ColorCIV';
_marker setMarkerTextLocal format['Car #%1', _teamNumber];

[_marker, _car] spawn {
	while { true } do {
		(_this select 0) setMarkerPosLocal (getPos (_this select 1));
		sleep 0.1;
	}
};
