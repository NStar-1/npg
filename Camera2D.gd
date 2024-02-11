extends Camera2D

var vp: Viewport
const DEAD_ZONE := 150
const SCROLL_SPEED_FACTOR := 0.1
var par: Node2D
var abs_limit_bottom: float
var abs_limit_right: float

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	vp = get_viewport()
	par = get_parent()
	limit_left = 0
	limit_top = 0
	limit_right = par.get_rect().size.x
	limit_bottom = par.get_rect().size.y
	# limit coordinates relative to the camera origin (top left)
	abs_limit_right = limit_right - vp.size.x / zoom.x
	abs_limit_bottom = limit_bottom - vp.size.y / zoom.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var m_pos := vp.get_mouse_position()

	if m_pos.x < DEAD_ZONE:
		position.x = max(limit_left, position.x - (DEAD_ZONE - m_pos.x) * SCROLL_SPEED_FACTOR)
	elif m_pos.x > vp.size.x - DEAD_ZONE:
		position.x =  min(abs_limit_right, position.x + (-vp.size.x + DEAD_ZONE + m_pos.x) * SCROLL_SPEED_FACTOR)

	if m_pos.y < DEAD_ZONE:
		position.y = max(limit_top, position.y - (DEAD_ZONE - m_pos.y) * SCROLL_SPEED_FACTOR)
	elif m_pos.y > vp.size.y - DEAD_ZONE:
		position.y = min(abs_limit_bottom, position.y + (-vp.size.y + DEAD_ZONE + m_pos.y) * SCROLL_SPEED_FACTOR)


func _input(event):
	if event is InputEventMouseButton:
		print("MC", event.position)
