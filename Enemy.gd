extends KinematicBody

var speed = 500

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	var collidedObject
	if (collidedObject):
		print(collidedObject.collider.name)
		if "Player" in collidedObject.collider.name:
			collidedObject.get_collider().queue_free()
