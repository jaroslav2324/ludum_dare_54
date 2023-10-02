extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_exit_pressed():
	get_tree().quit()


func _on_restart_pressed():
	var pauseMode = not get_tree().paused
	get_tree().paused = pauseMode
	visible = pauseMode
	get_tree().reload_current_scene()


func _on_game_base_is_dead():
	var pauseMode = not get_tree().paused
	get_tree().paused = pauseMode
	visible = pauseMode
