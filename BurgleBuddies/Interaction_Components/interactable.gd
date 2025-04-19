extends Area2D

@export var interact_name: String = ""
@export var is_interactable: bool = true
@export var is_res_interactable: bool = true

var interact: Callable = func():
	pass

var res_interact: Callable = func():
	pass
