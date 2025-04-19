extends RigidBody2D

@onready var interactable: Area2D = $Interactable
@onready var sprite_2d: Sprite2D = $Sprite2D

signal picked_up

func _ready() -> void:
	interactable.res_interact = _on_interact
	#get game controller
	var gameController = get_node("/root/CameraControl")
		#subscribe game controller to this item signal
	picked_up.connect(gameController.get_Board)

func _on_interact():
	print("Board picked up")
	picked_up.emit()
