extends Sprite2D

var initial_material: ShaderMaterial = null

# Called when the node enters the scene tree for the first time.
func _ready():
	initial_material = material
	material = null


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Cusstom handlers
func on_mouse_enter():
	material = initial_material
	
func on_mouse_exit():
	material = null



