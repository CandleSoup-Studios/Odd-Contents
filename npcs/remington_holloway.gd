extends NpcInteraction

var npc_data = {
	"name": "RemingtonHolloway"
}

func get_npc_name() -> String:
	return npc_data["name"]
	
func _ready():
	$Sprite2D/IdleAnimation.animation_finished.connect(_on_idle_animation_finished)
	
func _on_idle_animation_finished():
	$Sprite2D/IdleAnimation.pause()
	$Sprite2D/IdleAnimation.play("idle")
	
func _input(event) -> void:
	print("out")
	if player_in_range and Input.is_action_just_pressed("dialogue_interaction"):
		print("outer")
		if Global.current_quest["npc"] == npc_data["name"]:
			$Sprite2D/IdleAnimation.play("surprise")
		else:
			print("inner")
			Dialogic.start("npc_remy_goaway")	
			await Dialogic.timeline_ended
		
func _on_interaction_area_body_entered(body: Node2D) -> void:
		if body.is_in_group("player"):
			player_in_range = true
			
			if Global.current_quest["npc"] == npc_data["name"]:
				interaction_prompt.visible = true
