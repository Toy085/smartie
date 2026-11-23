extends Node3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	TransitionLayer.fade(0.0)
	#animation_player.play("intro_cutscene")
