@icon("res://addons/at-icons/node2d/mountains.svg")
extends Node2D

@onready var wife: CharacterBody2D = $Wife

@export var waypoints: Array[Node2D]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if not wife:
		return
	if wife.position.distance_to(waypoints[0].position) < 1:
		wife.interact_move()
		wife.set_target(waypoints[1].position)

func _move_wife():
	wife.set_target(waypoints[0].position)
