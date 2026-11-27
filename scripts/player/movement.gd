extends CharacterBody2D
class_name Player

@export var speed = 100

@onready var action_area: Area2D = $ActionArea
@onready var talk_delay: Timer = $TalkDelay
@onready var hinting: AnimatedSprite2D = $hinting

var in_dialouge: bool = false

func _ready() -> void:
	hinting.play("press")

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	velocity = velocity.clampf(-speed, speed)
	
	if Input.is_action_just_pressed("ui_accept"):
		var actionables = action_area.get_overlapping_areas()
		if actionables.size() == 0:
			return
		if actionables[0] is DialogueActionable2D && not in_dialouge:
			actionables[0].action()
			in_dialouge = true
			if actionables[0].dialogue_ended.is_connected(_on_dialogue_end):
				actionables[0].dialogue_ended.disconnect(_on_dialogue_end) # Fix this mess
			actionables[0].dialogue_ended.connect(_on_dialogue_end)
			return
		
		if not in_dialouge && actionables[0] is MoveTo:
			await TransitionLayer.fade(1.0, 0.5).finished
			actionables[0].move_to(self)
			TransitionLayer.fade(0.0)
			return

func _physics_process(_delta):
	if in_dialouge:
		return
	if action_area.get_overlapping_areas().size() >0:
		hinting.show()
		
	else:
		hinting.hide()
	get_input()
	move_and_slide()

func _on_dialogue_end():
	talk_delay.start()
	await talk_delay.timeout
	in_dialouge = false
