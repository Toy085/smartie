extends Area2D
class_name MoveTo

@export var target: Vector2

signal finished

func move_to(object: CharacterBody2D):
	object.global_position = target
	return finished
