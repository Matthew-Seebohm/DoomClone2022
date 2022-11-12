extends Button

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_Main_Menu_Button_pressed():
	get_tree().change_scene("res://main_menu.tscn")
