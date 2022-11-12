extends MeshInstance

func _destroy():
	queue_free()

#when forst creting ths script is imply wrote, "if the player entered the area with the blue keycard, and pressed
#"E", the script would run the destroy function, deleting the door from the game world. This didn't happen since
#the script only activated for when the player first entered the area, not when they actively stayed within it.
#to counter this, ryan proposed to create a "true/false" variable that would change based on when the player entered
#the area.
func _on_Area_area_entered(area):
	print ("good")
	Global.locked_door = true

#similar to entering the area for the first time, when exiting the area the variable is set to false, so the player
#can't open the door from anywhere on the map
func _on_Area_area_exited(area):
	print ("better")
	Global.locked_door = false

#this is the "if" statement string that makes sure the player has all the right requirements for opening the door.
#first, if the true/false variable for the area is set to false, the player can moe onto the next requirement.
#if the player has picked up the keycard, move onto the last requirement, which is the input for interacting.
#after that the script runs the destroy function to open the door
func _process(delta):
	if Global.locked_door == true:
		print ("Entered")
		if (Global.blue_keycard) == true:
			print ("Bluekeycard")
			if Input.is_action_pressed("Interact"):
				print ("Destroy")
				_destroy()
