class_name NpcInteraction

extends Sprite2D

@onready var interaction_prompt = $InteractionPrompt

func _on_interaction_area_body_entered(body: Node2D) -> void:
	print("entered!")
	if body.is_in_group("player"):
		interaction_prompt.visible = true

func _on_interaction_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		interaction_prompt.visible = false
