extends CharacterBody2D

@export var speed = 400

var direction : Vector2 = Vector2()
var charVelocity : Vector2 = Vector2()

func read_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
		
func _physics_process(delta):
	read_input()
	move_and_slide()
