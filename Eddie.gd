extends KinematicBody

#resbonisbke for the enemy navigation
onready var nav = get_parent()
var path = []
var path_node = 0
#resbonisble for the enemy stats
var speed = 15
var enemy_health = 2
#loads the ammo box for the script to use
onready var ammoSource = preload ("res://Ammo.tscn")
#allows the script to use the player
onready var player = $"../../Player"
#loads the spawn point of the box, currently not functioning
onready var ammoSpawn = get_node("ammoSpawn")

#moves the enemy towards the player, the "if direction.length() is resbonisble for how far away the enemy should stay
func _physics_process(delta):
	if path_node < path.size():
		var direction = (path[path_node] - global_transform.origin)
		if direction.length() < 0.11:
			path_node +=1
		else:
			move_and_slide(direction.normalized() * speed, Vector3.UP)

#this function decides which path to tae towards the player (the most efficient path)
func move_to(target_pos):
	path = nav.get_simple_path(global_transform.origin, target_pos)
	path_node = 0

#after the timer runs out it executes the other movement functions
func _on_Timer_timeout():
	move_to(player.global_transform.origin)

#if the player enters the enemy'sbody, takes away ten from the player health value in the global script
func _on_Area_body_entered(body):
	if (body.name == "Player"):
		Global.player_health -= 10
		Global.combocount = 0

#if the enemy collided with a bullet, the enemy health value is decreased
func take_damage(damage):
	print("ouch")
	enemy_health -= 1
#if the enemy health equals zero, delete the enemy and spawn an ammo box
	if enemy_health <=0:
		queue_free()
		(Global.combocount) +=1
		var ammo = ammoSource.instance()
		get_node("/root/Devil Hunter").add_child(ammo)
		ammoSource.global_transform = ammoSpawn.global_transform
#currently the ammo box only spawns in one location and not where the enemy dies, 
#I've tried to make it spawn using similar means to the shooting mechanic, but to no avail
