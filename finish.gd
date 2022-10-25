extends MeshInstance

func _process(delta):
	if Global.finish == true:
		print ("Entered")
		if (Global.bluekeycard) == true:
			print ("Bluekeycard")
			if Input.is_action_pressed("Interact"):
				print ("Destroy")
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
				get_tree().change_scene("res://Win.tscn")


func _on_Area_area_entered(area):
	print ("finish?")
	Global.finish = true


func _on_Area_area_exited(area):
	print ("finish!")
	Global.finish = false
