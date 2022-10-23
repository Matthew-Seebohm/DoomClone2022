extends MeshInstance


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _destroy():
	queue_free()

func _on_Area_area_entered(area):
	if (area.name == "Player"):
		if (Global.bluekeycard) == true:
			if Input.is_action_just_pressed("Interact"):
				_destroy()
