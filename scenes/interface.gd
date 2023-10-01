extends Control

signal mineButton

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_mine_button_down():
	emit_signal("mineButton")
	print("mine button click")
