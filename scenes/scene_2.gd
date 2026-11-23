@icon("res://addons/at-icons/node2d/mountains.svg")
extends Node2D

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	TransitionLayer.fade(0.0)
