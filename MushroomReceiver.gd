extends Spatial

var _queue : Array = []


func _ready():
	pass # Replace with function body.


func add(mushroom : Spatial):
	#mushroom.visible = false
	#add_child(mushroom)
	_queue.push_back(mushroom)
	#mushroom.global_transform.origin = global_transform.origin

func pop():
	var mushroom = _queue.pop_back()
	if mushroom:
		pass#remove_child(mushroom)
	return mushroom
