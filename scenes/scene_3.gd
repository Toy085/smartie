extends Node2D

@export var dialogues: Array[DialogueResource]

func _ready() -> void:
	var player: Player = get_tree().get_nodes_in_group("player")[0]
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	await TransitionLayer.fade(0.0).finished
	player.in_dialouge = true


func showCar():
	
