@icon("res://addons/at-icons/node2d/human.svg")
extends CharacterBody2D

@export var speed = 100
@onready var interaction_area_2d: Area2D = $InteractionArea2D

@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D

func _physics_process(_delta: float):
	var dir = to_local(navigation_agent_2d.get_next_path_position()).normalized()
	if position.distance_to(navigation_agent_2d.target_position) < 2:
		navigation_agent_2d.target_position = global_position
	velocity = dir * speed
	move_and_slide()

func set_target(target: Vector2):
	navigation_agent_2d.set_target_position(target)

func interact_move():
	var actionables = interaction_area_2d.get_overlapping_areas()
	if actionables.size() > 0:
			actionables[0].move_to(self)
