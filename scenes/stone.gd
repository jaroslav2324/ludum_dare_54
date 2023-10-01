extends Area2D

var is_mouse_hovered = false
var spell_cast_btn_pressed = false
#var interfaceMineButton = false



# Called when the node enters the scene tree for the first time.
func _ready():
	# for proper mouse handling
	input_pickable = true
	
	get_node("../../").connect("spell_mine_stone_btn_pressed_sig", _on_spell_cast_sig)
	get_node("../../").connect("spell_mine_stone_btn_unpressed_sig", _on_spell_stop_cast_sig)

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("left"):
		print("spell_cast_btn_pressed ", spell_cast_btn_pressed)
	if Input.is_action_just_pressed("left") and is_mouse_hovered and spell_cast_btn_pressed:
		print("stone mine started")
		spell_cast_btn_pressed = false
		#var player1_node = get_node("mine/AudioStreamPlayer2D")
		# player1_node.
		#player1_node.play()
		#var player2_node = get_node("mine/AudioStreamPlayer2D2")
		#player2_node.play()
		#get_node("../../").spell_mine_stone_btn_unpressed_sig.emit()
		#get_node("../../").play_kupol_anim_sig.emit()
		$mine.visible = true
	# if Input.is_action_just_pressed("left") and is_mouse_hovered:
	# 	print("on stone clicked")
	
		


func _on_mouse_entered():
	is_mouse_hovered = true
	# print("Mouse entered stone")



func _on_mouse_exited():
	is_mouse_hovered = false
	# print("Mouse exited stone")


func  _on_spell_cast_sig():
	spell_cast_btn_pressed = true
	print("Spell cast")

func _on_spell_stop_cast_sig():
	spell_cast_btn_pressed = false
	print("Spell cast stopped")
