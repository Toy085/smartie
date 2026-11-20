@icon("res://addons/at-icons/node2d/mountains.svg")
extends Node2D

@onready var wife: CharacterBody2D = $Wife

@export var waypoints: Array[Node2D]

var dialouge: int = 0

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _process(_delta: float) -> void:
	if not wife:
		return
	if wife.position.distance_to(waypoints[0].position) < 1:
		wife.interact_move()
		wife.set_target(waypoints[1].position)

func _move_wife(num: int):
	if num == 0:
		wife.set_target(waypoints[0].position)
