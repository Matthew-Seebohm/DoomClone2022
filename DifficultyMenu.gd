extends Control

func _ready():
	$Slash.pressed = Global.SLASH

#after the difficulty scene has been exited, the button changing the difficulty is reset
#to counter this, a variable is created that is set to true when the switch is flipped,
#when changing the code according to the difficulty it should use "if" statements for the true/false variable
func _on_Slash_toggled(button_pressed):
	print ("SLASH enabled")
	Global.SLASH = button_pressed

#this function simply changes the scene from trhe difficulty menu to the main game, its very common for menus
func _on_Button_pressed():
	get_tree().change_scene("res://Devil Hunter.tscn")
