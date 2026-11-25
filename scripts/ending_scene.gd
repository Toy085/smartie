extends Control

@onready var bgm_player: AudioStreamPlayer = $BGM_player
@onready var rich_text_label: RichTextLabel = $RichTextLabel

func _ready() -> void:
	rich_text_label.text = "Ending: %s" % Global.ending
	await TransitionLayer.fade(0.0, 0.5)
	bgm_player.play()
