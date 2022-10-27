extends KinematicBody

onready var nav = get_parent()
var path = []
var path_node = 0
var speed = 15
var enemy_health = 2
onready var player = $"../../Player"

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if path_node < path.size():
		var direction = (path[path_node] - global_transform.origin)
		if direction.length() < 0.3:
			path_node +=1
		else:
			move_and_slide(direction.normalized() * speed, Vector3.UP)
			
func move_to(target_pos):
	path = nav.get_simple_path(global_transform.origin, target_pos)
	path_node = 0

func _on_Timer_timeout():
	move_to(player.global_transform.origin)

func _on_Area_body_entered(body):
	if (body.name == "Player"):
		Global.player_health -= 50
		Global.combocount = 0

func take_damage(damage):
	print("ouch")
	enemy_health -= 1
	if enemy_health <=0:
		queue_free()
		(Global.combocount) +=1
