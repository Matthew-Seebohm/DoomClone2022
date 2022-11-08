extends Spatial

func _on_Area_body_entered(body):
	if (body.name == "Player"):
		Global.bluekeycard = true
		queue_free()
