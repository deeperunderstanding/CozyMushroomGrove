extends StaticBody

signal recipe_success
signal recipe_failure

var recipe = Recipes.Recipe.new()

func interact(actor):
	var mush : Spatial = actor.mushrooms.pop()
	if mush:
		$MushroomHolder.add_child(mush)
		#todo move mushroom into cauldron, and remove it after validatong recipe
		mush.visible = true
		mush.global_transform.origin = $MushroomHolder.global_transform.origin
		_validate_recipe(mush)


func _validate_recipe(mush : Mushroom):
	var result = recipe.validate(mush)
	if result == Recipes.RecipeState.FAILURE:
		emit_signal("recipe_failure")
	elif result == Recipes.RecipeState.SUCCESS:
		emit_signal("recipe_success")
