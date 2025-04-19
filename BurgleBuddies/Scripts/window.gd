extends RigidBody2D

@onready var interactable: Area2D = $Interactable
@onready var interactable2: Area2D = $Interactable2
@onready var interactable3: Area2D = $Interactable3
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var gameController = get_node("/root/CameraControl")

signal interaction

func _ready() -> void:
	interactable.interact = _on_interact
	interactable2.interact = _on_interact2
	interactable3.res_interact = _on_interact3
	interaction.connect(gameController.get_player)
	interaction.connect(gameController.item_Status)

func _on_interact():
	var player2 = gameController.get_player(2)
	player2.set_position($Interactable/Go_In.global_position)
	
func _on_interact2():
	var player2 = gameController.get_player(2)
	player2.set_position($Interactable2/Go_Out.global_position)

func _on_interact3():
	#var player1 = gameController.get_player(1)
	gameController.item_Status("Board")
	if gameController.itemCheck == true:
		gameController.remove_Board()
		print("window locked")
		queue_free()
	else:
		print("no boards")
	
	
	
