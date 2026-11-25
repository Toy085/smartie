@icon("res://addons/at-icons/node2d/human.svg")
extends CharacterBody2D

@export var speed = 100
@onready var interaction_area_2d: Area2D = $InteractionArea2D

@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D

var target_pos: Vector2

func _ready() -> void:
	target_pos = self.position
	
func _physics_process(_delta: float):
	var dir = to_local(navigation_agent_2d.get_next_path_position()).normalized()
	velocity = dir * speed
	navigation_agent_2d.set_target_position(target_pos)
	if self.position.distance_to(target_pos) < 1:
		return
	move_and_slide()
	

func set_target(target: Vector2):
	target_pos = target
	navigation_agent_2d.set_target_position(target)

func interact_move():
	var actionables = interaction_area_2d.get_overlapping_areas()
	for i in actionables:
		if actionables[0] is MoveTo:
			actionables[0].move_to(self)
