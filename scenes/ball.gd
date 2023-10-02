extends RigidBody2D

var damage = 2
var speed = 700

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	body.apply_damage(damage)
	#queue_free()
	pass
