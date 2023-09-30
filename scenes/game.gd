extends Node2D

var pauseMode = true
var spell_mine_stone_btn_pressed = false
signal spell_mine_stone_btn_pressed_sig
signal spell_mine_stone_btn_unpressed_sig

# Called when the node enters the scene tree for the first time.
func _ready():
	# test
	# print("A")
	spell_mine_stone_btn_pressed_sig.emit()
	
	connect("spell_mine_stone_btn_pressed_sig", _on_spell_mine_stone_btn_pressed_sig)
	connect("spell_mine_stone_btn_unpressed_sig", _on_spell_mine_stone_btn_unpressed_sig)


func _process(delta):
	pass
#	if Input.is_action_just_pressed("exit"):
#		var pauseMode = not get_tree().paused
#		get_tree().paused = pauseMode
#		visible = pauseMode

func _on_spell_mine_stone_btn_pressed_sig():
	spell_mine_stone_btn_pressed = true
	print("Btn spell cast pressed")

func _on_spell_mine_stone_btn_unpressed_sig():
	spell_mine_stone_btn_pressed = false
	print("Btn spell cast unpressed")
