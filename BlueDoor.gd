extends MeshInstance

func _destroy():
	queue_free()

func _on_Area_area_entered(area):
	print ("good")
	Global.Locked_door = true

func _on_Area_area_exited(area):
	print ("better")
	Global.Locked_door = false

func _process(delta):
	if Global.Locked_door == true:
		print ("Entered")
		if (Global.bluekeycard) == true:
			print ("Bluekeycard")
			if Input.is_action_pressed("Interact"):
				print ("Destroy")
				_destroy()
