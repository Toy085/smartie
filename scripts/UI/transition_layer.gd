@icon("res://addons/at-icons/control/dropdown.svg")
extends CanvasLayer

@onready var color_rect: ColorRect = $ColorRect

func _ready() -> void:
	color_rect.material.set("shader_parameter/animation_progress", 0.0)

func fade(target_alpha: float, duration: float = 1.0):
	var tween = create_tween()
	tween.tween_property(color_rect, "material:shader_parameter/animation_progress", target_alpha, duration)
	return tween
