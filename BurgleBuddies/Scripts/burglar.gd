extends CharacterBody2D

@export var speed = 300
@export var move_distance := 50
@export var attacking = false
@onready var animation = $AnimationPlayer
@onready var gameController = get_node("/root/CameraControl")

signal has_Weapon

var direction : Vector2 = Vector2()

func _ready() -> void:
	has_Weapon.connect(gameController.weapon_Status)

func _physics_process(_delta):
	velocity = velocity * .9 
	if Input.is_action_just_pressed("burg_right"):
		velocity.x = speed
	if Input.is_action_just_pressed("burg_left"):
		velocity.x = -speed
	if Input.is_action_just_pressed("burg_up"):
		velocity.y = -speed
	if Input.is_action_just_pressed("burg_down"):
		velocity.y = speed
		
		
	position.x = clamp(position.x, -814, 2773)
	position.y = clamp(position.y, -1582, 725)
		
	move_and_slide()
	
	if Input.is_action_just_pressed("burg_attack"):
		attack()

func attack():
	gameController.set_Weapon_Status()
	if gameController.burgWeaponCheck == true:
		has_Weapon.emit()
		var overlapping_object = $attackArea.get_overlapping_areas()
	
		for area in overlapping_object:
			var parent = area.get_parent()
			print(parent)
			parent.queue_free()
	
		attacking = true
		animation.play("attackburg")
