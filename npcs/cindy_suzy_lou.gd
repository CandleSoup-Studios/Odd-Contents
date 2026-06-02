extends NpcInteraction

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event) -> void:
	if Input.is_action_just_pressed("dialogue_interaction"):
		#Dialogic.start()
		print("talk talk cindy!")
