extends RigidBody2D


@export var attack_radius = 512
@export var tower_damage = 1
@export var tower_attack_speed = 1.5
@export var towerFadeTime = 1
@export var maxHelth = 10
@export var hp = maxHelth

var target
var aimed_target = false
var ball = preload("res://scenes/ball.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	# magic tower has no collision
	hp = maxHelth
	$fadeTimer.start(towerFadeTime)
	$CollisionShape2D.disabled = false
	
	$AnimatedSprite2D.play("spawn")
	
	
	input_pickable = true
	contact_monitor = true
	var radius_scale: Vector2 = Vector2(attack_radius / 256.0, attack_radius / 256.0)
	# print("rad scale ", radius_scale)
	$radius/radiusSprite.apply_scale(radius_scale)
	$radius/radiusCollisionShape.apply_scale(radius_scale)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HPBar.value = hp
	if hp <= 0 :
		magicTowerDie()
	pass

func magicTowerDie():
	$AnimatedSprite2D.play("die")
	pass

func _on_mouse_entered():
	$radius/radiusSprite.show()
	print("Mouse enntered")
	pass 


func _on_mouse_exited():
	$radius/radiusSprite.hide()
	pass 


func _on_radius_body_entered(body):
	#print("Radius entered")
	#print("Body in enemies group", body.is_in_group("enemies"))
	if body.is_in_group("enemies") and not aimed_target:
		aimed_target = true
		target = body
		fire()
		#target.apply_damage(tower_damage)
		$radius/damageTimer.start(tower_attack_speed)
	pass # Replace with function body.


func _on_radius_body_exited(body):
	if body == target:
		#print("target = body")
		aimed_target = false
		$radius/damageTimer.stop()
	pass # Replace with function body.


func _on_damage_timer_timeout():
	fire()
	pass # Replace with function body.

func fire():
	$attackPlayer.play()
	$AnimatedSprite2D.play("fire")
	var instance = ball.instantiate()
	instance.position = position
	var a = instance.position - target.position
	instance.rotation = a.angle() + PI
	get_tree().get_root().add_child(instance)
	instance.apply_central_impulse(Vector2(700,0).rotated(instance.rotation))


func _on_animated_sprite_2d_animation_finished():
	if ($AnimatedSprite2D.animation == "spawn"):
		$AnimatedSprite2D.play("default")
	elif ($AnimatedSprite2D.animation == "fire"):
		$AnimatedSprite2D.play("default")
	elif ($AnimatedSprite2D.animation == "die"):
		queue_free()
	pass # Replace with function body.


func _on_fade_timer_timeout():
	hp -= 1
