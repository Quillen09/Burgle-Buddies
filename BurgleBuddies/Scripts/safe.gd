extends RigidBody2D

@onready var interactable: Area2D = $Interactable
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var gameController = get_node("/root/CameraControl")

signal picked_up

func _ready() -> void:
	interactable.interact = _on_interact
	picked_up.connect(gameController.open_Safe)

func _on_interact():
	
	if gameController.safeCheck == true:
		interactable.is_interactable = false
		print("Safe opened")
		queue_free()
	else:
		print("Safe locked")
	picked_up.emit()
	
