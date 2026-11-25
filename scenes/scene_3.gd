@icon("res://addons/at-icons/node2d/mountains.svg")
extends Node2D

@export var dialogues: Array[DialogueResource]
@onready var car: CharacterBody2D = $Car
var player: Player

func _ready() -> void:
	player = get_tree().get_nodes_in_group("player")[0]
	player.in_dialouge = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	await TransitionLayer.fade(0.0).finished
	while car.position.x < 90:
		car.position.x += 1
	DialogueManager.show_dialogue_balloon(dialogues[0])
	await DialogueManager.dialogue_ended
	player.in_dialouge = false

func give_dog():
	Global.do_ending(1)
