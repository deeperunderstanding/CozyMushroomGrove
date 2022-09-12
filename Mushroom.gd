extends StaticBody
class_name Mushroom

enum Types {
	Xylo, Amani, TreeDude
}

const names = {
	Types.Amani : "Amoneeta",
	Types.Xylo : "Phylosophers Cap",
	Types.TreeDude : "Tree Dude"
}

export var type = Types.Amani

class Flags:
	const near_water = "near_water"
	const near_tree_1 = "near_tree_1"

var flags : Dictionary = { }


# Called when the node enters the scene tree for the first time.
func _ready():
	Flags.near_water


func pick_up(picker):
	get_parent().remove_child(self)
	picker.mushrooms.add(self)
