extends Spatial
class_name Game

onready var middle_text = $"%MiddleText"
onready var failure_label = $"%FailureLabel"
onready var success_label = $"%SuccessLabel"

func _ready():
	middle_text.text = str(
		"Move with W,A,S,D", "\n",
		"Mouse to Look around", "\n",
		"E to Interact"
	)
	middle_text.visible = true


func _on_AlchemyStation_done():
	pass # Replace with function body.


func _on_AlchemyStation_failed():
	failure_label.text = "YOU FAILED"
	failure_label.visible = true


func _on_AlchemyStation_next():
	success_label.text = "SUCCESS"
	success_label.visible = true
