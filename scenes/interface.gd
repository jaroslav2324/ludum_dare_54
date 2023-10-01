extends Control

signal mineToggled(buttonPresed)
signal magicTowerToggled(buttonPresed)
signal towerToggled(buttonPresed)

var Coins
var Manna

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Panel/coinCount.text = str(Coins)
	$Panel/ProgressBar.value = Manna
	pass

func _on_game_currency(coins, manna):
	Coins = coins
	Manna = manna


func _on_mine_toggled(button_pressed):
	emit_signal("mineToggled", button_pressed)
	$Panel/magicTower.button_pressed = false
	$Panel/realTowe.button_pressed = false



func _on_magic_tower_toggled(button_pressed):
	emit_signal("magicTowerToggled", button_pressed)
	$Panel/realTowe.button_pressed = false
	$Panel/mine.button_pressed = false
	

func _on_real_towe_toggled(button_pressed):
	emit_signal("towerToggled", button_pressed)
	$Panel/magicTower.button_pressed = false
	$Panel/mine.button_pressed = false
	
