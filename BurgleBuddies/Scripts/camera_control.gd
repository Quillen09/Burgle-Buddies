extends Node

@onready var items = []
@onready var resident_hud: CanvasLayer = $HBoxContainer/SubViewportContainer/SubViewport/ResidentHud

@onready var players := {
	"1": {
		viewport = $"HBoxContainer/SubViewportContainer/SubViewport",
		camera = $"HBoxContainer/SubViewportContainer/SubViewport/Camera2D",
		player = $"HBoxContainer/SubViewportContainer/SubViewport/Node2D/Resident"	
	},
	"2": {
		viewport = $"HBoxContainer/SubViewportContainer2/SubViewport",
		camera = $"HBoxContainer/SubViewportContainer2/SubViewport/Camera2D",
		player = $"HBoxContainer/SubViewportContainer/SubViewport/Node2D/Burglar"
	}
}


func _ready() -> void:
	players["2"].viewport.world_2d = players["1"].viewport.world_2d
	
	for node in players.values():
		var remote_transform := RemoteTransform2D.new()
		remote_transform.remote_path = node.camera.get_path()
		node.player.add_child(remote_transform)
	
		
func get_Weapon():
	#append item to array
	items.append("knife")
	#update UI
	var weaponIcon = resident_hud.find_child("Weapon")
	var weaponName = resident_hud.find_child("WeaponName")
	weaponIcon.texture = load("res://Assets/1740679987064.png")
	weaponName.text = "Knife"
	#hud_control.onItemPickUp
	print(items)
