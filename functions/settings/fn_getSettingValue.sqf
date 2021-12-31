params ['_settingName'];

// settings

_sectorsWP = [2, 8]; // first number - last wp in first sector, second number - last wp in second sector
_WPCount = 9;





// workaround to make global constants works

private '_result';

switch (_settingName) do {
	case 'sectorsWP': { _result = _sectorsWP; };
	case 'WPCount': { _result = _WPCount; };
};

_result;
