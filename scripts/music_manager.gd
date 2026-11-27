@icon("res://addons/at-icons/node/note_double.svg")
extends Node

const WHIMSICAL_CONVERSATION_HEARTFALL_GAME = preload("res://sound/music/Whimsical Conversation - Heartfall Game.mp3")

var audio_music: AudioStreamPlayer = AudioStreamPlayer.new()

func _ready() -> void:
	audio_music.bus = "Music"
	add_child(audio_music)
	
func play_music(Music: AudioStream = WHIMSICAL_CONVERSATION_HEARTFALL_GAME):
	audio_music.stream = Music
	audio_music.play()

func stop_music():
	audio_music.stream = null
	audio_music.stop()
