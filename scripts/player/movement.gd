extends CharacterBody2D

@export var speed = 100

@onready var talk_area: Area2D = $TalkArea

var in_dialouge: bool = false

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	velocity = velocity.clampf(-speed, speed)
	
	if Input.is_action_just_pressed("ui_accept"):
		var actionables = talk_area.get_overlapping_areas()
		if actionables.size() > 0 && not in_dialouge:
			actionables[0].action()
			in_dialouge = true
			if actionables[0].dialogue_ended.is_connected(_on_dialouge_end):
				actionables[0].dialogue_ended.disconnect(_on_dialouge_end)
			actionables[0].dialogue_ended.connect(_on_dialouge_end)

func _physics_process(_delta):
	get_input()
	move_and_slide()

func _on_dialouge_end():
	in_dialouge = false
