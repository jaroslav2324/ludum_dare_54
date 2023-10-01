extends Node2D

var pauseMode = true
var spell_mine_stone_btn_pressed = false
signal spell_mine_stone_btn_pressed_sig
signal spell_mine_stone_btn_unpressed_sig
signal play_kupol_anim_sig

signal currency(coins, manna)

var beginCoins = 100
var beginManna = 100

var coins = beginCoins
var manna = beginManna

# Called when the node enters the scene tree for the first time.
func _ready():
	# test
	# print("A")
	spell_mine_stone_btn_pressed_sig.emit()
	
	connect("spell_mine_stone_btn_pressed_sig", _on_spell_mine_stone_btn_pressed_sig)
	connect("spell_mine_stone_btn_unpressed_sig", _on_spell_mine_stone_btn_unpressed_sig)
	connect("play_kupol_anim_sig", _on_play_kupol_anim_sig)

func _process(delta):
	emit_signal("currency", coins, manna)
	pass

func _on_spell_mine_stone_btn_pressed_sig():
	spell_mine_stone_btn_pressed = true
	print("Btn spell cast pressed")

func _on_spell_mine_stone_btn_unpressed_sig():
	spell_mine_stone_btn_pressed = false
	print("Btn spell cast unpressed")
	
func _on_play_kupol_anim_sig():
	get_node("construction/base/kupol").play()
