@icon ("res://addons/at-icons/node/globe.svg")
extends Node

const END = preload("uid://duusmjvxluagm")

const SAVE_PATH := "user://"

var current_scene: int = 0
var fikk_hund: bool = false
var tell_wife: bool = false

var is_mobile_os = OS.has_feature("mobile") or OS.has_feature("web_android") or OS.has_feature("web_ios")
var is_web = OS.has_feature("web")

func change_scene(path: String):
	await TransitionLayer.fade(1.0).finished
	get_tree().change_scene_to_file(path)

func do_ending(_type: int):
	await TransitionLayer.fade(1.0).finished
	get_tree().change_scene_to_file("res://scenes/UI-based/Ending.tscn")
	var audio = AudioStreamPlayer.new()
	audio.stream = END
	add_child(audio)
	audio.play()

func get_save(slot: int = 0) -> String:
	return SAVE_PATH.path_join("save_%s.tres" % slot)
	
func save_game(slot: int = 0) -> void:
	var data := Save.new()
	data.current_scene = current_scene
	data.fikk_hund = fikk_hund
	
	ResourceSaver.save(data, get_save(slot))

func load_game(slot: int = 0) -> void:
	if not ResourceLoader.exists(get_save(slot)):
		return

	var data := ResourceLoader.load(get_save(slot)) as Save
	if data:
		current_scene = data.current_scene

func delete_save(slot: int = 0) -> void:
	if FileAccess.file_exists(get_save(slot)):
		DirAccess.remove_absolute(get_save(slot))
