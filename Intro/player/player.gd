extends CharacterBody3D

@export var speed: float = 5.0
@export var mouse_sens: float = 0.25

@onready var head: Node3D = $Head

var lerp_speed: float = 10.0
var dir: Vector3 = Vector3.ZERO
var frozen: bool = false

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause"):
		get_tree().quit()
	if frozen:
		return
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(event.relative.x * -mouse_sens))
		head.rotate_x(deg_to_rad(event.relative.y * -mouse_sens))
		head.rotation.x = clampf(head.rotation.x, deg_to_rad(-89), deg_to_rad(89))

func _physics_process(delta: float) -> void:
	if frozen:
		return
	if not is_on_floor():
		velocity += get_gravity() * delta

	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	dir = lerp(dir, transform.basis * Vector3(input_dir.x, 0, input_dir.y).normalized(), lerp_speed * delta)
	if dir:
		velocity.x = dir.x * speed
		velocity.z = dir.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)

	move_and_slide()
