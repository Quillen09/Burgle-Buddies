extends Node

@onready var resident_hud: CanvasLayer = $HBoxContainer/SubViewportContainer/SubViewport/ResidentHud
@onready var burglar_hud: CanvasLayer = $HBoxContainer/SubViewportContainer2/SubViewport/BurglarHud

	
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
	
	var burgWeaponIcon = burglar_hud.find_child("Weapon")
	var burgWeaponName = burglar_hud.find_child("WeaponName")
	burgWeaponIcon.texture = load("res://Assets/1740679987064.png")
	burgWeaponName.text = "Knife"
	
		
func get_Weapon():
	#update UI
	var resWeaponIcon = resident_hud.find_child("Weapon")
	var resWeaponName = resident_hud.find_child("WeaponName")
	resWeaponIcon.texture = load("res://Assets/1740679987064.png")
	resWeaponName.text = "Knife"

func get_Item():
	#update UI
	var burgWeaponIcon = burglar_hud.find_child("Item")
	var burgWeaponName = burglar_hud.find_child("ItemName")
	burgWeaponIcon.texture = load("res://icon.svg")
	burgWeaponName.text = "Key"

func open_Safe():
	var burgWeaponName = burglar_hud.find_child("ItemName")
	if burgWeaponName.text == "key":
		print("yo");
