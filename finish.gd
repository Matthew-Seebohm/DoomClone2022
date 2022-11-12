extends MeshInstance

#this script is for the final win conditon, whenit runs, it sends the player to the win scene
#Using the same code for the locked door, this means the requirements for finishing the game
#is to collect the blue keycard
func _process(delta):
	if Global.finish == true:
		print ("Entered")
		if (Global.blue_keycard) == true:
			print ("Bluekeycard")
			if Input.is_action_pressed("Interact"):
				print ("Destroy")
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
				get_tree().change_scene("res://Win.tscn")

#these printing lines are for testing if the area works
func _on_Area_area_entered(area):
	print ("finish?")
	Global.finish = true


func _on_Area_area_exited(area):
	print ("finish!")
	Global.finish = false
