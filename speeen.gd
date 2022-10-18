extends Sprite

var degrees_per_second = 359999640.0

func _process(delta):
	rotate(delta * deg2rad(degrees_per_second))
