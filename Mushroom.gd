extends StaticBody
class_name Mushroom

enum Types {
	Philosopher, Amoneeto, TreeRot
}

const names = {
	Types.Amoneeto : "Amoneeto",
	Types.Philosopher : "Philosophers Cap",
	Types.TreeRot : "Tree Rot"
}

export var type = Types.Amoneeto


const near_water = "growing near water"
const under_pine = "growing under Pine"

export var attributes : Dictionary = { 
	near_water : false,
	under_pine : false
}


func interaction():
	return str("[E] Pick Up ", names[type])

func interact(picker):
	get_parent().remove_child(self)
	$CollisionShape.disabled = true
	picker.mushrooms.add(self)
