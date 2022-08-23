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

func _ready():
	pass

func _input (event):
	if event is InputEventMouseMotion:
		mouseDelta = event.relative

func _process (delta):
	camera.rotation_degrees -= Vector3(rad2deg(mouseDelta.y), 0, 0) * lookSensitivity * delta
	camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, minCamVerticalAngle, maxCamVerticalAngle)
	rotation_degrees -= Vector3(0, rad2deg(mouseDelta.x), 0) * lookSensitivity * delta
	mouseDelta = Vector2()

func _physics_process (delta):
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