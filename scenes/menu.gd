extends Control

# useless ?
signal asd 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("exit"):
		print("asdas")
		var pauseMode = not get_tree().paused
		get_tree().paused = pauseMode
		visible = pauseMode
		# print("Game paused: ", pauseMode)
#	if Input.is_action_just_pressed("exit"):
#		get_tree().paused = not get_tree().paused


func _on_continue_button_down():
	var pauseMode = not get_tree().paused
	get_tree().paused = pauseMode
	visible = pauseMode
	# print("Game paused: ", pauseMode)


func _on_exit_button_down():
	get_tree().quit()
