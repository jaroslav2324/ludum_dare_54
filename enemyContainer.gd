extends Node2D


var enemy_scene = preload("res://scenes/enemy.tscn")
@export var spawn_rate = 0.5
@export var changeDirT = 5
@export var timeout = 10
signal containerSayHeDaead



var rng = RandomNumberGenerator.new()

var direction = randi()%4

signal sayDirection(dir)

# Called when the node enters the scene tree for the first time.
func _ready():
	$timeout.start(timeout)
	emit_signal("sayDirection", direction)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_spawn_timer_timeout():
	# spawn Enemy
	#print("Enemy spawned")
	rng.randomize()
	var x
	var y
	if direction == 0:
		x = $spawnMarkerUp.position.x + rng.randi_range(-1024, 1024)
		y = $spawnMarkerUp.position.y
	if direction == 1:
		x = $spawnMarkerDown.position.x + rng.randi_range(-1024, 1024)
		y = $spawnMarkerDown.position.y
	if direction == 2:
		x = $spawnMarkerLeft.position.x 
		y = $spawnMarkerLeft.position.y + rng.randi_range(-1024, 1024)
	if direction == 3:
		x = $spawnMarkerRight.position.x
		y = $spawnMarkerRight.position.y + rng.randi_range(-1024, 1024)
	var enemy = enemy_scene.instantiate()
	add_child(enemy)
	enemy.position = Vector2(x, y)
	enemy.farmerDead.connect(sayFarmerDead)
	pass # Replace with function body.

func sayFarmerDead():
	#print("container say he dead")
	emit_signal("containerSayHeDaead")


func _on_change_dir_timeout():
	$timeout.start(timeout)
	$spawnTimer.stop()
	$changeDir.stop()
	direction = randi()%4
	emit_signal("sayDirection", direction)
	



func _on_timeout_timeout():
	$spawnTimer.start(spawn_rate)
	$changeDir.start(changeDirT)
	$timeout.stop()
