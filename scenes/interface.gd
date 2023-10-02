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
	if Input.is_action_just_pressed("mT"):
		_on_magic_tower_button_down()
		$Panel/magicTower.button_pressed = not $Panel/magicTower.button_pressed
	if Input.is_action_just_pressed("min"):
		_on_mine_button_down()
		$Panel/mine.button_pressed = not $Panel/mine.button_pressed
	if Input.is_action_just_pressed("rT"):
		_on_real_towe_button_down()
		$Panel/realTowe.button_pressed = not $Panel/realTowe.button_pressed
	pass

func _on_game_currency(coins, manna):
	Coins = coins
	Manna = manna


func _on_mine_toggled(button_pressed):
	print("asdasd")
	emit_signal("mineToggled", button_pressed)




func _on_magic_tower_toggled(button_pressed):
	emit_signal("magicTowerToggled", button_pressed)

	

func _on_real_towe_toggled(button_pressed):
	emit_signal("towerToggled", button_pressed)

	


func _on_magic_tower_button_down():
	$Panel/realTowe.button_pressed = false
	$Panel/mine.button_pressed = false


func _on_mine_button_down():
	$Panel/magicTower.button_pressed = false
	$Panel/realTowe.button_pressed = false


func _on_real_towe_button_down():
	$Panel/magicTower.button_pressed = false
	$Panel/mine.button_pressed = false
