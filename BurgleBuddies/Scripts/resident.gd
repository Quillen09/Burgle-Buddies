extends CharacterBody2D

@export var speed = 300
@export var attacking = false
@onready var animation = $AnimationPlayer

var direction : Vector2 = Vector2()

func _physics_process(_delta):
	velocity = velocity * .9 
	if Input.is_action_just_pressed("res_right"):
		velocity.x = speed
	if Input.is_action_just_pressed("res_left"):
		velocity.x = -speed
	if Input.is_action_just_pressed("res_up"):
		velocity.y = -speed
	if Input.is_action_just_pressed("res_down"):
		velocity.y = speed
		
	position.x = clamp(position.x, -814, 2773)
	position.y = clamp(position.y, -1582, 725)
		
	move_and_slide()
	
	if Input.is_action_just_pressed("res_attack"):
		attack()

func attack():
	var overlapping_object = $attackArea.get_overlapping_areas()
	
	for area in overlapping_object:
		var parent = area.get_parent()
		print(parent)
		parent.queue_free()
	
	attacking = true
	animation.play("attack")
