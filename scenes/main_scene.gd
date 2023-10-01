extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("exit"):
		get_node("menu").position =  get_node("game/gameCamera").position
	get_node("interface").position = get_node("game/gameCamera").position - Vector2(958, -298)


func _on_interface_mine_button():
	print("mine button click main scene see true")
	get_node("game").spell_mine_stone_btn_pressed_sig.emit()
	


func _on_interface_mine_button_no():
	pass
	#print("mine button click main scene see false")
	#get_node("game/construction/stone").spell_cast_btn_pressed = false
