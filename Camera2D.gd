extends Camera2D
var dragging = false
var previous_position = Vector2.ZERO
var zoom_step = 1.1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.is_pressed():
			previous_position = event.position
			dragging = true
		else:
			dragging = false
	elif event is InputEventMouseMotion and dragging:
		position += (previous_position - event.position)
		previous_position = event.position
	elif event is InputEventMouseButton:
		var mouse_position = event.position
		if event.button_index == BUTTON_WHEEL_UP:
			zoom_at_point(1/zoom_step,mouse_position)
		else : if event.button_index == BUTTON_WHEEL_DOWN:
			zoom_at_point(zoom_step,mouse_position)

func zoom_at_point(zoom_change, point):
	var viewport_size = get_viewport().size
	var new_zoom = zoom * zoom_change # next zoom value

	position = position + (-0.5*viewport_size + point)*(zoom - new_zoom)
	zoom = new_zoom
	
