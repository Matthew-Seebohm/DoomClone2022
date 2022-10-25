extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Slash.pressed = Global.SLASH



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Slash_toggled(button_pressed):
	print ("SLASH enabled")
	Global.SLASH = button_pressed


func _on_Button_pressed():
	get_tree().change_scene("res://Devil Hunter.tscn")
