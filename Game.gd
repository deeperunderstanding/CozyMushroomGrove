extends Spatial
class_name Game

onready var middle_text = $"%MiddleText"
onready var failure_label = $"%FailureLabel"
onready var success_label = $"%SuccessLabel"

var game_time = 0

var queued_text = [
	str(
		"Move with W,A,S,D", "\n",
		"Mouse to Look around", "\n",
		"E to Interact"
	),
	str(
		"Collect the mushrooms from the recipe", "\n",
		"and throw them into the cauldron", "\n",
		"to make potions", "\n"
	)
]

func _ready():
	middle_text.text = queued_text.pop_front()
	middle_text.visible = true


func _process(delta):
	game_time += delta


func _input(event):
	if Input.is_action_just_released("LMB"):
		var next = queued_text.pop_front()
		if next:
			middle_text.text = next
			middle_text.visible = true
		else:
			middle_text.visible = false

func _on_AlchemyStation_done():
	success_label.text = "SUCCESS"
	success_label.visible = true
	yield(get_tree().create_timer(2.0), "timeout")
	
	success_label.text = "YOU DID IT, CONGRATULATIONS!"
	success_label.visible = true
	yield(get_tree().create_timer(2.0), "timeout")
	
	game_time = int(game_time)
	var seconds = game_time%60
	var minutes = (game_time/60)%60
	var hours = (game_time/60)/60
	
	success_label.text = "FINISHED IN: " + str(hours, ":", minutes, ":", seconds)
	success_label.visible = true
	yield(get_tree().create_timer(5.0), "timeout")
	
	success_label.visible = false
	


func _on_AlchemyStation_failed():
	failure_label.text = "YOU FAILED"
	failure_label.visible = true
	yield(get_tree().create_timer(3.0), "timeout")
	
	get_tree().reload_current_scene()

func _on_AlchemyStation_next():
	success_label.text = "SUCCESS"
	success_label.visible = true
	yield(get_tree().create_timer(2.0), "timeout")
	
	success_label.text = "NEXT RECIPE"
	success_label.visible = true
	yield(get_tree().create_timer(2.0), "timeout")
	
	success_label.visible = false
	return
