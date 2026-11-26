@icon("res://addons/at-icons/node2d/mountains.svg")
extends Node2D

@export var dialogues: Array[DialogueResource]

var player: Player

func _ready() -> void:
	player = get_tree().get_nodes_in_group("player")[0]
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	player.in_dialouge = true
	await TransitionLayer.fade(0.0).finished
	DialogueManager.show_dialogue_balloon(dialogues[0])
	await DialogueManager.dialogue_ended

func wear_shirt():
	player.in_dialouge = false
