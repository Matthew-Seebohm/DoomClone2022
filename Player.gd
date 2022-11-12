extends KinematicBody

#Physics
var movement_speed = 9
var jump_strength = 3.5
var gravity = 10.0

#Cam look
var min_cam_vertical_angle = -90.0
var max_cam_vertical_angle = 90.0
var look_sensitivity = 0.5

# vectors
var player_velocity : Vector3 = Vector3()
var mouseDelta : Vector2 = Vector2()

onready var camera = get_node("Camera")
onready var bullet_scene = preload("res://bullet.tscn")
onready var bullet_spawn = get_node("Camera/bulletSpawn")
onready var bullet_spawn2 = get_node("Camera/bulletSpawn2")


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input (event):
	if event is InputEventMouseMotion:
		mouseDelta = event.relative

func _process (delta):
	camera.rotation_degrees -= Vector3(rad2deg(mouseDelta.y), 0, 0) * look_sensitivity * delta
	camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, min_cam_vertical_angle, max_cam_vertical_angle)
	rotation_degrees -= Vector3(0, rad2deg(mouseDelta.x), 0) * look_sensitivity * delta
	mouseDelta = Vector2()
	$Camera/Bluekeycard.text = str(Global.blue_keycard)
	$Camera/playerhealth.text = str(Global.player_health)
	$Camera/ammo_heavy.text = str (Global.ammo_heavy)
	$Camera/ammo_light.text = str (Global.ammo_light)
	$Camera/ComboCount.text = str (Global.combo_count)
	if Global.player_health <= 0:
		print("Dead")
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().change_scene("res://lose.tscn")
	if Input.is_action_just_pressed("shoot"):
		if (Global.ammo_heavy) >=1:
			shoot()
			if (Global.SLASH) == true:
				if (Global.ammo_heavy) <=0:
					get_tree().change_scene("res://lose.tscn")

	if Input.is_action_just_pressed("secondary"):
		if (Global.ammo_light) >=1:
			Secondary()
			if (Global.SLASH) == true:
				if (Global.ammo_light) <=0:
					get_tree().change_scene("res://lose.tscn")

func shoot ():
	var bullet = bullet_scene.instance()
	get_node("/root/devil_hunter").add_child(bullet)
	bullet.global_transform = bullet_spawn.global_transform
	bullet.scale = Vector3(-0.1,-0.1,-0.1)
	(Global.ammo_heavy) -= 1

func Secondary ():
	var bullet = bullet_scene.instance()
	get_node("/root/devil_hunter").add_child(bullet)
	bullet.global_transform = bullet_spawn2.global_transform
	bullet.scale = Vector3(-0.1,-0.1,-0.1)
	(Global.ammo_light) -= 1

func _physics_process (delta):
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	player_velocity.x = 0
	player_velocity.z = 0
	var input = Vector2()
	if Input.is_action_pressed("player_forward"):
		input.y -= 1
	if Input.is_action_pressed("player_backward"):
		input.y += 1
	if Input.is_action_pressed("player_left"):
		input.x -= 1
	if Input.is_action_pressed("player_right"):
		input.x += 1
	input = input.normalized()
	var forward = global_transform.basis.z
	var right = global_transform.basis.x
	player_velocity.z = (forward * input.y + right * input.x).z * movement_speed
	player_velocity.x = (forward * input.y + right * input.x).x * movement_speed
	player_velocity.y -= gravity * delta
	player_velocity = move_and_slide(player_velocity, Vector3.UP)
	if Input.is_action_pressed("jump") and is_on_floor():
		player_velocity.y = jump_strength

