extends Node2D

var pauseMode = true
var spell_mine_stone_btn_pressed = false
signal spell_mine_stone_btn_pressed_sig
signal spell_mine_stone_btn_unpressed_sig
signal play_kupol_anim_sig

signal currency(coins, manna)

var beginCoins = 100
var beginManna = 100
var magicTowersPrice = 20
var realTowerPrice = 100
var karkaPrice = 10 

var miningMine = 10
var mannaForMurder = 5
var mannaBuffer = 0

var coins = beginCoins
var manna = beginManna

var magicTowerCanSpawn = false
var realTowerCanSpawn = false
var magicTower = preload("res://scenes/tower_magic.tscn")
var realTower = preload("res://scenes/tower.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	# test
	# print("A")
	#spell_mine_stone_btn_pressed_sig.emit()
#
	connect("spell_mine_stone_btn_pressed_sig", _on_spell_mine_stone_btn_pressed_sig)
	connect("spell_mine_stone_btn_unpressed_sig", _on_spell_mine_stone_btn_unpressed_sig)
	connect("play_kupol_anim_sig", _on_play_kupol_anim_sig)

func _process(delta):
	emit_signal("currency", coins, manna)
	$icons.position = get_global_mouse_position()
	
	if magicTowerCanSpawn and Input.is_action_just_pressed("left") and manna >= magicTowersPrice:
		magicTowerSpawn(get_global_mouse_position())
	if realTowerCanSpawn and Input.is_action_just_pressed("left") and coins >= realTowerPrice:
		realTowerSpawn(get_global_mouse_position())
#	if mannaBuffer > 0:
#		mannaBuffer -= 1
#		manna += mannaForMurder
#		if manna > beginManna: manna = beginManna

func _on_spell_mine_stone_btn_pressed_sig():
	spell_mine_stone_btn_pressed = true
	print("Btn spell cast pressed")
	

func _on_spell_mine_stone_btn_unpressed_sig():
	spell_mine_stone_btn_pressed = false
	print("Btn spell cast unpressed")
	
func _on_play_kupol_anim_sig():
	get_node("construction/base/kupol").play()
	
func magicTowerSpawn(pos):
	print("try spawn magic tower")
	var instance = magicTower.instantiate()
	instance.position = Vector2(floor(pos.x/64+1)*64, floor(pos.y/64 + 1)*64)
	print("position ",instance.position)
	get_node("construction").add_child(instance)
	manna -= magicTowersPrice

func realTowerSpawn(pos):
	print("try spawn real tower")
	var instance = realTower.instantiate()
	instance.position = Vector2(floor(pos.x/64+1)*64, floor(pos.y/64 + 1)*64)
	print("position ",instance.position)
	get_node("construction").add_child(instance)
	coins -= realTowerPrice
	pass


func _on_ambient_player_finished():
	$ambientPlayer.play()
	pass 


func _on_stone_pay_kirka():
	manna -= karkaPrice


func _on_stone_add_coins():
	coins += miningMine


func _on_enemy_container_container_say_he_daead():
	print("manna must up")
	manna += mannaForMurder
	if manna > beginManna: manna = beginManna
	pass # Replace with function body.

signal base_Is_Dead

func _on_base_base_is_dead():
	emit_signal("base_Is_Dead")
