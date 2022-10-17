extends KinematicBody

#Physics
var movementSpeed = 9
var jumpStrength = 3.5
var gravity = 10.0

#Cam look
var minCamVerticalAngle = -90.0
var maxCamVerticalAngle = 90.0
var lookSensitivity = 0.5

# vectors
var playerVelocity : Vector3 = Vector3()
var mouseDelta : Vector2 = Vector2()

onready var camera = get_node("Camera")
onready var bulletScene = preload("res://Bullet.tscn")
onready var bulletSpawn = get_node("Camera/bulletSpawn")
onready var bulletSpawn2 = get_node("Camera/bulletSpawn2")
var ammoheavy : int = 15

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input (event):
	if event is InputEventMouseMotion:
		mouseDelta = event.relative

func _process (delta):
	camera.rotation_degrees -= Vector3(rad2deg(mouseDelta.y), 0, 0) * lookSensitivity * delta
	camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, minCamVerticalAngle, maxCamVerticalAngle)
	rotation_degrees -= Vector3(0, rad2deg(mouseDelta.x), 0) * lookSensitivity * delta
	mouseDelta = Vector2()
	$Camera/playerScore.text = str(Global.current_score)
	if Global.player_health <= 0:
		print("Dead")
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().change_scene("res://Lose.tscn")
	if Input.is_action_just_pressed("shoot"):
		shoot()
	if Input.is_action_just_pressed("secondary"):
		Secondary()
		
func shoot ():
	var bullet = bulletScene.instance()
	get_node("/root/Devil Hunter").add_child(bullet)
	bullet.global_transform = bulletSpawn.global_transform
	bullet.scale = Vector3(-0.1,-0.1,-0.1)
	ammoheavy -= 1

func Secondary ():
	var bullet = bulletScene.instance()
	get_node("/root/Devil Hunter").add_child(bullet)
	bullet.global_transform = bulletSpawn2.global_transform
	bullet.scale = Vector3(-0.1,-0.1,-0.1)
	ammoheavy -= 1

func _physics_process (delta):
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	playerVelocity.x = 0
	playerVelocity.z = 0
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
	playerVelocity.z = (forward * input.y + right * input.x).z * movementSpeed
	playerVelocity.x = (forward * input.y + right * input.x).x * movementSpeed
	playerVelocity.y -= gravity * delta
	playerVelocity = move_and_slide(playerVelocity, Vector3.UP)
	if Input.is_action_pressed("jump") and is_on_floor():
		playerVelocity.y = jumpStrength

