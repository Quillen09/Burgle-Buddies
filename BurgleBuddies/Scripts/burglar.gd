extends CharacterBody2D

@export var speed = 400
@export var move_distance := 50
@onready var itemHeld = "";
@onready var weaponHeld = "Knife";

var direction : Vector2 = Vector2()

func _physics_process(_delta):
	if Input.is_action_just_pressed("burg_right"):
		position.x += move_distance
	if Input.is_action_just_pressed("burg_left"):
		position.x -= move_distance
	if Input.is_action_just_pressed("burg_up"):
		position.y -= move_distance
	if Input.is_action_just_pressed("burg_down"):
		position.y += move_distance
		
	position.x = clamp(position.x, -430, 2414)
	position.y = clamp(position.y, -1098, 266)
		
	move_and_slide()
