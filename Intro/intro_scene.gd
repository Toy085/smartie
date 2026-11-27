extends Node3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var elevator: Node3D = $Elevator
@onready var audio_stream_player: AudioStreamPlayer = $"No Options/AudioStreamPlayer"
@onready var cutscene_cam: Camera3D = $cutscene
@onready var cutscene_player: AnimationPlayer = $CutscenePlayer

var door_open: bool = false
var done_doors: bool = false
var player: CharacterBody3D

func _ready() -> void:
	elevator.close_door()
	var player = get_tree().get_nodes_in_group("player")[0]
	player.frozen = true
	cutscene_cam.current = true
	TransitionLayer.fade(0.0)
	cutscene_player.play("cutscene")
	await cutscene_player.animation_finished
	cutscene_cam.current = false
	player.frozen = false

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body in get_tree().get_nodes_in_group("player"):
		await elevator.close_door()
		Global.change_scene("res://scenes/scene_1.tscn")

func _on_door_sensor_body_entered(_body: Node3D) -> void:
	if door_open:
		return
	await elevator.open_door()
	door_open = true

func _on_no_options_body_entered(body: Node3D) -> void:
	if done_doors:
		return
	if body is CharacterBody3D:
		audio_stream_player.play()
		done_doors = true
