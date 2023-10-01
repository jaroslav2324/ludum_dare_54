extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("exit"):
		get_node("menu").position =  get_node("game/gameCamera").position
	get_node("interface").position = get_node("game/gameCamera").position - Vector2(958, -298)
