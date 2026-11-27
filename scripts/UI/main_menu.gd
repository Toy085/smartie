@icon("res://addons/at-icons/control/dropdown.svg")
extends Control

func _on_play_button_pressed() -> void:
	Global.change_scene("res://Intro/intro_scene.tscn")
