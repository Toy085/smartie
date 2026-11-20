extends Area2D

@export var target: Vector2

func move_to(object: CharacterBody2D):
	object.global_position = target
