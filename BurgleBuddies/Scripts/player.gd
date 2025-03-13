extends CharacterBody2D

@export var speed = 400
@export var move_distance := 50

var direction : Vector2 = Vector2()
#var charVelocity : Vector2 = Vector2()

#func read_input():
	#var input_direction = Input.get_vector("left", "right", "up", "down")
	#velocity = input_direction * speed
		
func _physics_process(_delta):
	#read_input()
	
	if Input.is_action_just_pressed("right"):
		position.x += move_distance
	if Input.is_action_just_pressed("left"):
		position.x -= move_distance
	if Input.is_action_just_pressed("up"):
		position.y -= move_distance
	if Input.is_action_just_pressed("down"):
		position.y += move_distance
		
	position.x = clamp(position.x, -430, 2414)
	position.y = clamp(position.y, -1098, 266)
		
	move_and_slide()
