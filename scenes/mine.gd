extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animated_sprite_2d_animation_looped():
	if is_visible():
		$AudioStreamPlayer2D.play()


func _on_animated_sprite_2d_2_animation_looped():
	if is_visible():
		$AudioStreamPlayer2D2.play()
