extends CharacterBody2D

@export var speed = 300
@export var move_distance := 50

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
