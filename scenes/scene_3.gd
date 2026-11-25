extends Node2D

@export var dialogues: Array[DialogueResource]
@onready var car: Node2D = $Car
var player: Player

func _ready() -> void:
	player = get_tree().get_nodes_in_group("player")[0]
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	await TransitionLayer.fade(0.0).finished
	player.in_dialouge = true
	await showCar()
	DialogueManager.show_dialogue_balloon(dialogues[0])
	await DialogueManager.dialogue_ended
	player.in_dialouge = false


func showCar():
	while car.position.x < 0:
		car.position.x += 1
	return
