params ['_settingName'];

// settings

_sectorsWP = [2, 8]; // first number - last wp in first sector, second number - last wp in second sector





// workaround to make global constants works

private '_result';

switch (_settingName) do {
	case '_sectorsWP': { _result = _sectorsWP; };
};

_result;
