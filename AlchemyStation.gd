extends Spatial
class_name AlchemyStation

signal failed
signal next
signal done

var recipes = [
	Recipes.OrderedQuantityWithAttributeRecipe.new([
		Recipes.AttributeRecipePart.new(1, Mushroom.Types.Philosopher, [Mushroom.under_pine]),
		Recipes.AttributeRecipePart.new(1, Mushroom.Types.TreeRot, [Mushroom.near_water])
	], "Deine Mudda"),
	Recipes.SimpleQuantityRecipe.new({
		Mushroom.Types.Philosopher : 1,
		Mushroom.Types.Amoneeto : 2
	}, "Potion A"),
	Recipes.OrderedQuantityRecipe.new([
		Mushroom.Types.TreeRot, 
		Mushroom.Types.TreeRot,
		Mushroom.Types.Amoneeto
	], "Potion B"),
	Recipes.QuantityWithAttributeRecipe.new([
		Recipes.AttributeRecipePart.new(1, Mushroom.Types.Philosopher, [Mushroom.under_pine]),
		Recipes.AttributeRecipePart.new(1, Mushroom.Types.Amoneeto, []),
		Recipes.AttributeRecipePart.new(1, Mushroom.Types.TreeRot, [Mushroom.near_water])
	], "Potion C")
]


var t_recipes = [
	Recipes.SimpleQuantityRecipe.new({
		Mushroom.Types.Amoneeto : 1
	}, "Test A"),
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
