extends RigidBody2D

@export var speed : int = 1
@export var farmer_damage: float = 1
@export var farmer_attack_speed: float = 0.5


var reached_base = false


# Called when the node enters the scene tree for the first time.
func _ready():
	# for collision
	contact_monitor = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var  direction_vector: Vector2
	if not reached_base:
		
		# (0, 0) for base coords (get_node("base".position?)
		direction_vector = Vector2(0 - position.x, 0 - position.y)
		
		var collision = move_and_collide(direction_vector * speed * delta)
		if collision != null:
			var collider_name: String = collision.get_collider().name
			print("enemy collided with ", collider_name)
			if collider_name == "base":
				reached_base = true
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




func _on_body_entered(body):
	
	pass # Replace with function body.


func _on_timer_attack_timeout():
	print("Dealed damage to base ", farmer_damage)
	var base = get_node("../../construction/base")
	base.base_hp -= farmer_damage
	print("New base hp ", base.base_hp)
	if base.base_hp <= 0:
		$TimerAttack.stop()
		if (position.x < 0):
			$AnimatedSprite2D.play("go_right")
		else:
			$AnimatedSprite2D.play("go_left")
		$AnimatedSprite2D.set_frame_and_progress(0, 0)
		$AnimatedSprite2D.stop()
	pass # Replace with function body.