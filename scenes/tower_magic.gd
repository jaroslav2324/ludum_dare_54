extends RigidBody2D


@export var attack_radius = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	input_pickable = true
	var radius_scale: Vector2 = Vector2(attack_radius / 256.0, attack_radius / 256.0)
	# print("rad scale ", radius_scale)
	$radiusSprite.apply_scale(radius_scale)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_mouse_entered():
	$radiusSprite.show()
	pass # Replace with function body.


func _on_mouse_exited():
	$radiusSprite.hide()
	pass # Replace with function body.
