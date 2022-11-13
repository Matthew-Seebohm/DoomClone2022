extends Sprite

#the amount of degrees per second the variable allows
var degrees_per_second = 359999640.0

#rotates the attached asset according to the variable above
func _process(delta):
	rotate(delta * deg2rad(degrees_per_second))
