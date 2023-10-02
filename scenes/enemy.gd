extends RigidBody2D

@export var speed : int = 1
@export var farmer_damage: float = 1
@export var farmer_attack_speed: float = 0.5
@export var farmer_hp: float = 10

var collider_name

var reached_target = false
var farmer_dead = false
var dead_animation_playing = false

signal farmerDead


# Called when the node enters the scene tree for the first time.
func _ready():
	# for collision
	contact_monitor = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if farmer_dead:
		return
		
	var  direction_vector: Vector2
	if not reached_target:
		
		# (0, 0) for base coords (get_node("base".position?)
		direction_vector = Vector2(0 - position.x, 0 - position.y)
		
		var collision = move_and_collide(direction_vector * speed * delta)
		if collision != null:
			collider_name = collision.get_collider().name
			#collider_name = "base"
			# print("enemy collided with ", collider_name)
			#if collider_name == "base":
			reached_target = true
			$TimerAttack.start(farmer_attack_speed)
			$AnimatedSprite2D.stop()
			if position.x < 0:
				$AnimatedSprite2D.play("attack_right")
			else:
				$AnimatedSprite2D.play("attack_left")
		else:
			if position.x < 0:
				$AnimatedSprite2D.play("go_right")
			else:
				$AnimatedSprite2D.play("go_left")
		
	pass


func apply_damage(damage: float):
	farmer_hp -= damage
	$damageReceivePlayer.play()
	#print("Farmer recieved damage ", damage, ", current hp = ", farmer_hp)
	if farmer_hp <= 0:
		print("farmerDead")
		emit_signal("farmerDead")
		farmer_dead = true
		$deadSoundPlayer.play()
		$AnimatedSprite2D.play("dead_burst")
		dead_animation_playing = true


func _on_body_entered(body):
	
	pass # Replace with function body.


func _on_timer_attack_timeout():
	# print("Dealed damage to base ", farmer_damage)
	$dealDamagePlayer.play()
	var str = "../../construction/" + collider_name
	var attackOn = get_node(str)
	print(attackOn)
	if attackOn != null:
		attackOn.hp -= farmer_damage
	else:
		reached_target = false
		collider_name = ""
		$TimerAttack.stop()
	# print("New base hp ", base.base_hp)
#	if attackOn.hp <= 0:
#		$TimerAttack.stop()
#		if (position.x < 0):
#			$AnimatedSprite2D.play("go_right")
#		else:
#			$AnimatedSprite2D.play("go_left")
#		$AnimatedSprite2D.set_frame_and_progress(0, 0)
#		$AnimatedSprite2D.stop()
	pass # Replace with function body.


func _on_animated_sprite_2d_animation_finished():
	if dead_animation_playing:
		# hide()
		
		queue_free()
	pass # Replace with function body.


#if collision != null:
#			collider_name = collision.get_collider().name
#			#collider_name = "base"
#			# print("enemy collided with ", collider_name)
#			if collider_name == "base":
#				reached_base = true
#				$TimerAttack.start(farmer_attack_speed)
#				$AnimatedSprite2D.stop()
#				if position.x < 0:
#					$AnimatedSprite2D.play("attack_right")
#				else:
#					$AnimatedSprite2D.play("attack_left")
