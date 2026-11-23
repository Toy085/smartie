@icon("res://addons/at-icons/node3d/door.svg")
extends Node3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func open_door():
	animation_player.play("opening")
