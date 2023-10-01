extends Node2D


var enemy_scene = preload("res://scenes/enemy.tscn")
var spawn_rate = 0.5

# Called when the node enters the scene tree for the first time.
func _ready():
	$spawnTimer.start(spawn_rate)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_spawn_timer_timeout():
	# spawn Enemy
	print("Enemy spawned")
	var x = randi() % 1000 - 500
	var y = randi() % 1000 - 500
	var enemy = enemy_scene.instantiate()
	add_child(enemy)
	enemy.position = Vector2(x, y)
	pass # Replace with function body.
