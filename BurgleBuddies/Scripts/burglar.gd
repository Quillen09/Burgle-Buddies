extends CharacterBody2D

@export var speed = 300
@export var move_distance := 50
@export var attacking = false
@onready var animation = $AnimationPlayer
@onready var gameController = get_node("/root/CameraControl")
@onready var sprite = $Sprite2D

signal has_Weapon

var direction : Vector2 = Vector2()

func _ready() -> void:
	has_Weapon.connect(gameController.weapon_Status)

func _physics_process(_delta):
	velocity = velocity * .9 
	if velocity.is_equal_approx(Vector2.ZERO):
		sprite.play("idle")
	if Input.is_action_just_pressed("burg_right"):
		velocity.x = speed
		sprite.play("walkRight")
	if Input.is_action_just_pressed("burg_left"):
		velocity.x = -speed
		sprite.play("walkLeft")
	if Input.is_action_just_pressed("burg_up"):
		velocity.y = -speed
		sprite.play("walkUp")
	if Input.is_action_just_pressed("burg_down"):
		velocity.y = speed
		sprite.play("walkDown")
		
		
		
	position.x = clamp(position.x, -1000, 2900)
	position.y = clamp(position.y, -1775, 950)
		
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
