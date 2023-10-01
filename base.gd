extends RigidBody2D

@export var base_hp: float = 15

var print_base_dead: bool = true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if base_hp <= 0 and print_base_dead:
		print_base_dead = false
		print("Base dead")
	pass


func _on_kupol_animation_finished():
	$kupol.set_frame_and_progress(0, 0)

