extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("exit"):
		get_node("menu").position =  get_node("game/gameCamera").position
	get_node("interface").position = get_node("game/gameCamera").position - Vector2(958, -298)


func _on_interface_mine_toggled(buttonPresed):
	if buttonPresed:
		get_node("game").spell_mine_stone_btn_pressed_sig.emit()
		get_node("game/icons/kirkaIcon").visible = true
	if !buttonPresed:
		get_node("game").spell_mine_stone_btn_unpressed_sig.emit()
		get_node("game/icons/kirkaIcon").visible = false


func _on_interface_magic_tower_toggled(buttonPresed):
	if buttonPresed:
		get_node("game/icons/magicTowerIcon").visible = true
		get_node("game").magicTowerCanSpawn = true
	if !buttonPresed:
		get_node("game/icons/magicTowerIcon").visible = false
		get_node("game").magicTowerCanSpawn = false


func _on_interface_tower_toggled(buttonPresed):
	if buttonPresed:
		get_node("game/icons/towerIcon").visible = true
		get_node("game").realTowerCanSpawn = true
	if !buttonPresed:
		get_node("game/icons/towerIcon").visible = false
		get_node("game").realTowerCanSpawn = false
