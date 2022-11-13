extends Button

#when the player presses the button, it changes the scene to the difficulty menu
func _on_Play_Button_pressed():
	get_tree().change_scene("res://difficulty_menu.tscn")
