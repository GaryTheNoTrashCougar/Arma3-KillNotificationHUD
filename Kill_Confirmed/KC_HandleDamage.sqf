0 = [] spawn
{
	while {true} do
	{
		{
			_x  setVariable ["shooterIndex",[]];
			_x  addEventHandler ["HandleDamage",
			{
				params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];
				(_unit getVariable "shooterIndex") pushBackUnique _instigator;
				_damage
			}];
		_x setVariable ["passedThatHandleDamage",TRUE];
		} forEach (allUnits select {isNil {_x getVariable "passedThatHandleDamage"}});
	sleep 2;
	};
};
