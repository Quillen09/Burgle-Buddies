extends RigidBody2D

@onready var interactable: Area2D = $Interactable
@onready var sprite_2d: Sprite2D = $Sprite2D

signal picked_up

func _ready() -> void:
	interactable.res_interact = _on_interact
	#get game controller
	var gameController = get_node("/root/CameraControl")
		#subscribe game controller to this item signal
	picked_up.connect(gameController.get_Weapon)

func _on_interact():
	interactable.is_res_interactable = false
	print("knife was picked up")
	$Sprite2D.visible = false
	queue_free()
	picked_up.emit()
	
	
