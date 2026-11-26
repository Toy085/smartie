@icon("res://addons/at-icons/node2d/mountains.svg")
extends Node2D

@export var dialogues: Array[DialogueResource]

func _ready() -> void:
	var player: Player = get_tree().get_nodes_in_group("player")[0]
	player.in_dialouge = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	await TransitionLayer.fade(0.0).finished
	DialogueManager.show_dialogue_balloon(dialogues[0])
	await DialogueManager.dialogue_ended
