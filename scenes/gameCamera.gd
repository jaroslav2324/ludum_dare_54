extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("w"):
		position += Vector2(0, -10)
	if Input.is_action_pressed("s"):
		position += Vector2(0, 10)
	if Input.is_action_pressed("a"):
		position += Vector2(-10, 0)
	if Input.is_action_pressed("d"):
		position += Vector2(10, 0)
