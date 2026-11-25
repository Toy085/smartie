@icon("res://addons/at-icons/node2d/mountains.svg")
extends Node2D

@export var dialogues: Array[DialogueResource]

@onready var car: CharacterBody2D = $Car
@onready var familie: Node2D = $Familie

var player: Player

func _ready() -> void:
	player = get_tree().get_nodes_in_group("player")[0]
	player.in_dialouge = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	await TransitionLayer.fade(0.0).finished
	while car.position.x < 90:
		car.position.x += 1
	familie.show()
	DialogueManager.show_dialogue_balloon(dialogues[0])
	await DialogueManager.dialogue_ended

func give_dog():
	pass
