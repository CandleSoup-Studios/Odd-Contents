extends NpcInteraction

var npc_data = {
	"name": "HarveyJakes"
}

func get_npc_name() -> String:
	return npc_data["name"]
	
func _input(event) -> void:
	if player_in_range and Input.is_action_just_pressed("dialogue_interaction"):
		$AnimatedSprite2D.play("hello")
		super(event)
