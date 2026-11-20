extends CharacterBody2D

@export var speed = 100

@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D

func _physics_process(_delta: float):
	var dir = to_local(navigation_agent_2d.get_next_path_position()).normalized()
	velocity = dir * speed
	move_and_slide()

func set_target(target: Vector2):
	navigation_agent_2d.set_target_position(target)
