extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _mouse_enter():
	$sprite.on_mouse_enter()
	
func _mouse_exit():
	$sprite.on_mouse_exit()
