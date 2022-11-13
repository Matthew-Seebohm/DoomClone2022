extends Spatial

#when an object with the name "Player" enters the area of the pickup, the variable is set to true and the
#pickup deletes itself
func _on_Area_body_entered(body):
	if (body.name == "Player"):
		Global.blue_keycard = true
		queue_free()
