extends CharacterBody2D

@export var speed = 300
@export var attacking = false
@onready var animation = $AnimationPlayer
@onready var gameController = get_node("/root/CameraControl")
@onready var sprite = $Sprite2D
@onready var interacting_component: Node2D = $InteractingComponent

signal has_Weapon

var direction : Vector2 = Vector2()

func _ready() -> void:
	has_Weapon.connect(gameController.weapon_Status)
	interacting_component.can_interact = false

func _physics_process(_delta):
	velocity = velocity * .9 
	if Input.is_action_just_pressed("res_right"):
		velocity.x = speed
		sprite.play("walkRight")
	if Input.is_action_just_pressed("res_left"):
		velocity.x = -speed
		sprite.play("walkLeft")
	if Input.is_action_just_pressed("res_up"):
		velocity.y = -speed
		sprite.play("walkUp")
	if Input.is_action_just_pressed("res_down"):
		velocity.y = speed
		sprite.play("walkDown")
	if  velocity.is_equal_approx(Vector2.ZERO):
		sprite.play("idle")
	position.x = clamp(position.x, -1000, 2900)
	position.y = clamp(position.y, -1775, 950)
		
	move_and_slide()
	
	if Input.is_action_just_pressed("res_attack"):
		attack()

func attack():
	gameController.set_Weapon_Status()
	if gameController.resWeaponCheck == true:
		has_Weapon.emit()
		var overlapping_object = $attackArea.get_overlapping_areas()
	
		for area in overlapping_object:
			var parent = area.get_parent()
			print(parent)
			parent.queue_free()
			await get_tree().create_timer(1.0).timeout
			get_tree().change_scene_to_file("res://Scenes/end.tscn")
	
		attacking = true
		animation.play("attack")
		
