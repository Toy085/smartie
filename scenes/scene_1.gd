@icon("res://addons/at-icons/node2d/mountains.svg")
extends Node2D

@onready var wife: CharacterBody2D = $Wife
@onready var player: CharacterBody2D = $Player
@onready var dialogue_actionable_2d: DialogueActionable2D = $Wife/DialogueActionable2D

@export var waypoints: Array[Node2D]
@export var dialogues: Array[DialogueResource]

var dialouge: int = 0

func _ready() -> void:
	dialogue_actionable_2d.dialogue_resource = dialogues[0]
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		get_tree().quit()
	if not wife:
		return
	if wife.position.distance_to(waypoints[0].position) < 1:
		wife.interact_move()
		wife.set_target(waypoints[1].position)

func move_wife(num: int):
	if num == 0:
		wife.set_target(waypoints[0].position)
		dialogue_actionable_2d.dialogue_resource = dialogues[1]
		player._on_dialogue_end()
