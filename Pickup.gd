extends Spatial

func _on_Area_body_entered(body):
	if (body.name == "Player"):
		Global.blue_keycard = true
		queue_free()
