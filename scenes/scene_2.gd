@icon("res://addons/at-icons/node2d/mountains.svg")
extends Node2D

@export var dialogues: Array[DialogueResource]

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	await TransitionLayer.fade(0.0).finished
	DialogueManager.show_dialogue_balloon(dialogues[0])
