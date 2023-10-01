extends Control

signal mineToggled(buttonPresed)

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
