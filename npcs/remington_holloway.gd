extends NpcInteraction

var npc_data = {
	"name": "RemingtonHolloway",
	"quest_triggered": false
}

func get_npc_name() -> String:
	return npc_data["name"]
	
func get_npc_quest_triggered() -> bool:
	return npc_data["quest_triggered"]
	
func _ready():
	$Sprite2D/IdleAnimation.animation_finished.connect(_on_idle_animation_finished)
	Dialogic.signal_event.connect(_on_signal)
	
func _on_signal(signal_passed_in):
	match signal_passed_in:
		"remy_zoom_in":
			zoom_camera(global_position, Vector2(0.8, 0.8), 0.4)
		"remy_zoom_out":
			zoom_camera(camera_position, camera_zoom, 0.4)
	
func _on_idle_animation_finished():
	$Sprite2D/IdleAnimation.pause()
	$Sprite2D/IdleAnimation.play("idle")
	
func _input(event) -> void:
	if player_in_range and Input.is_action_just_pressed("dialogue_interaction"):
		if Global.current_quest["npc"] == npc_data["name"]:
			$Sprite2D/IdleAnimation.play("surprise")
			super(event)
		elif Global.story_act == 1 or Global.current_quest["quest_type"] < 3:
			Dialogic.start("npc_remingtonholloway_goaway")	
			await Dialogic.timeline_ended
		elif Global.story_act == 3:
			Dialogic.start("npc_remingtonholloway_generic_before_3")
			await Dialogic.timeline_ended
		else:
			super(event)
