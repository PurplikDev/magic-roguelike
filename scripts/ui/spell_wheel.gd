extends Control

func _process(delta):
	var rotation_per_child: float = 360.0 / get_child_count()
	var current_index: int = 0
	
	var children = get_children()
	
	for child in children:
		if child is Control:
			child.rotation_degrees = (rotation_per_child * current_index) - 90
			current_index += 1
