extends RigidBody2D

var maxHp = 15

@export var base_hp: float = maxHp
signal baseIsDead

var print_base_dead: bool = true


# Called when the node enters the scene tree for the first time.
func _ready():
	$HPBar.max_value= maxHp
	$HPBar.value = maxHp

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HPBar.value = base_hp
	if base_hp <= 0 and print_base_dead:
		print_base_dead = false
		$kupol.hide()
		$base.play("destroyed")
		print("Base dead")
		emit_signal("baseIsDead")
	pass


func _on_kupol_animation_finished():
	$kupol.set_frame_and_progress(0, 0)

