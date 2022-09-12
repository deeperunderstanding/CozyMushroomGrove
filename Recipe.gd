extends Reference
class_name Recipes

enum RecipeState { CONTINUE, SUCCESS, FAILURE }

class Recipe:
	func validate(mushroom):
		pass
		
	func text_lines() -> Array:
		return []

class SimpleQuantityRecipe extends Recipe:
	
	var recipe = {}
	var name = null
	
	func _init(recipe_map, name = null):
		recipe = recipe_map
		
	func validate(mushroom):
		recipe[mushroom.type] -= 1
		var missing = 0
		for key in recipe:
			var amnt = recipe[key]
			if amnt < 0:
				print("FAILED")
				return RecipeState.FAILURE
			else:
				missing += amnt
		if missing == 0:
			return RecipeState.SUCCESS
		else:
			return RecipeState.CONTINUE
			
	func text_lines():
		var lines = []
		for key in recipe:
			var amnt = recipe[key]
			lines.append(str(amnt) + "x " + Mushroom.names[key])
		return lines
