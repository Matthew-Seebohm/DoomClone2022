extends Button

#when the player enters the win/lose scene, the mouse will automatically be relased
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

#moves the player to the main menu scene when the button is pressed
func _on_Main_Menu_Button_pressed():
	get_tree().change_scene("res://main_menu.tscn")
