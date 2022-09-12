extends Spatial
class_name AlchemyStation

signal failed
signal next
signal done

var recipes = [
	Recipes.SimpleQuantityRecipe.new({
		Mushroom.Types.Xylo : 1,
		Mushroom.Types.Amani : 2,
		Mushroom.Types.TreeDude: 0 
	}),
	Recipes.SimpleQuantityRecipe.new({ 
		Mushroom.Types.Xylo : 0,
		Mushroom.Types.Amani : 1,
		Mushroom.Types.TreeDude: 2 
	})
]


func _ready():
	_next()

func _next():
	var next = recipes.pop_front()
	$Cauldron.recipe = next
	$Sign_2/RecipeDisplay.render_lines(next.text_lines())
	
func _on_Cauldron_recipe_failure():
	emit_signal("failed")

func _on_Cauldron_recipe_success():
	if recipes.size() > 0:
		emit_signal("next")
		_next()
	else:
		emit_signal("done")
