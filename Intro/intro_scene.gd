extends Node3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	TransitionLayer.fade(0.0)
	#animation_player.play("intro_cutscene")


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body in get_tree().get_nodes_in_group("player"):
		Global.change_scene("res://scenes/scene_1.tscn")
