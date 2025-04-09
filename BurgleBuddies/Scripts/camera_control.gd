extends Node

@onready var resident_hud: CanvasLayer = $HBoxContainer/SubViewportContainer/SubViewport/ResidentHud
@onready var burglar_hud: CanvasLayer = $HBoxContainer/SubViewportContainer2/SubViewport/BurglarHud
@onready var safeCheck = open_Safe()
@onready var escapeCheck = burglar_Escape()
@onready var burgWeaponCheck = set_Weapon_Status()
@onready var resWeaponCheck = set_Weapon_Status()
@onready var itemCheck = false

	
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
	var burgItemIcon = burglar_hud.find_child("Item")
	var burgItemName = burglar_hud.find_child("ItemName")
	burgItemIcon.texture = load("res://Assets/key.png")
	burgItemName.text = "Key"

func open_Safe():
	safe_Status()
	var burgWeaponIcon = burglar_hud.find_child("Item")
	var burgWeaponName = burglar_hud.find_child("ItemName")
	
	if safeCheck == true:
		burgWeaponIcon.texture = load("res://Assets/mushroom.png")
		burgWeaponName.text = "Money"
	else:
		print("Missing key")
	
		
func safe_Status():
	var burgItemName = burglar_hud.find_child("ItemName")
	if burgItemName.text == "Key":
		safeCheck = true
	else:
		safeCheck = false
		
func set_Weapon_Status():
	weapon_Status()
		
func weapon_Status():
	var burgWeaponName = burglar_hud.find_child("WeaponName")
	var resWeaponName = resident_hud.find_child("WeaponName")
	
	if burgWeaponName.text == "Knife":
		burgWeaponCheck = true
	else:
		burgWeaponCheck = false
		
	if resWeaponName.text == "Knife":
		resWeaponCheck = true
	else:
		resWeaponCheck = false
		
func burglar_Escape():
	escape_Status()
	
	if escapeCheck == true:
		get_tree().change_scene_to_file("res://Scenes/end.tscn")
	else:
		print("Gimme the goods")
	
		
func escape_Status():
	var burgItemName = burglar_hud.find_child("ItemName")
	if burgItemName.text == "Money":
		escapeCheck = true
	else:
		escapeCheck = false
		
func get_player(i):
	if i == 2:
		return players["2"].player
	if i == 1:
		return players["1"].player
		
func item_Status(itemName):
	var resItemName = resident_hud.find_child("ItemName")
	if resItemName.text == itemName:
		itemCheck = true
	else:
		itemCheck = false
		
func get_Board():
	var resItemIcon = resident_hud.find_child("Item")
	var resItemName = resident_hud.find_child("ItemName")
	resItemIcon.texture = load("res://icon.svg")
	resItemName.text = "Board"
