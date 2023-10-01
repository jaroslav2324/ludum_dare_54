extends RigidBody2D


@export var attack_radius = 256
@export var tower_damage = 2
@export var tower_attack_speed = 1

var target
var aimed_target = false

# Called when the node enters the scene tree for the first time.
func _ready():
	input_pickable = true
	contact_monitor = true
	var radius_scale: Vector2 = Vector2(attack_radius / 256.0, attack_radius / 256.0)
	# print("rad scale ", radius_scale)
	$radius/radiusSprite.apply_scale(radius_scale)
	$radius/radiusCollisionShape.apply_scale(radius_scale)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass


func _on_mouse_entered():
	$radius/radiusSprite.show()
	# print("Mouse enntered")
	pass # Replace with function body.


func _on_mouse_exited():
	$radius/radiusSprite.hide()
	pass # Replace with function body.


func _on_radius_body_entered(body):
	print("Radius entered")
	print("Body in enemies group", body.is_in_group("enemies"))
	if body.is_in_group("enemies") and not aimed_target:
		aimed_target = true
		target = body
		target.apply_damage(tower_damage)
		$radius/damageTimer.start(tower_attack_speed)
	pass # Replace with function body.


func _on_radius_body_exited(body):
	# print("Body in enemies group", body.is_in_group("enemies"))
	
	# if body.is_in_group("enemies"):
	if body == target:
		print("target = body")
		aimed_target = false		
		$radius/damageTimer.stop()
		# print("Radius exited")
	pass # Replace with function body.


func _on_damage_timer_timeout():
	target.apply_damage(tower_damage)
	pass # Replace with function body.
