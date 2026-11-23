extends Node3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var elevator: Node3D = $Elevator

var door_open: bool = false

func _ready() -> void:
	TransitionLayer.fade(0.0)
	elevator.close_door()
	#animation_player.play("intro_cutscene")


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body in get_tree().get_nodes_in_group("player"):
		await elevator.close_door()
		Global.change_scene("res://scenes/scene_1.tscn")


func _on_door_sensor_body_entered(_body: Node3D) -> void:
	if door_open:
		return
	await elevator.open_door()

func _on_door_sensor_body_exited(_body: Node3D) -> void:
	if not door_open:
		return
	await elevator.close_door()
