extends NpcInteraction

var npc_data = {
	"name": "HarveyJakes",
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
		"harvey_zoom_in":
			zoom_camera(global_position, Vector2(0.8, 0.8), 0.4)
		"harvey_zoom_out":
			zoom_camera(camera_position, camera_zoom, 0.4)
	
func _on_idle_animation_finished():
	$Sprite2D/IdleAnimation.pause()
	
	if $Sprite2D/IdleAnimation.animation == "hello":
		$Sprite2D/IdleAnimation.play("idle")
	
func _input(event) -> void:
	if player_in_range and Input.is_action_just_pressed("dialogue_interaction"):
		if Global.current_quest["npc"] == npc_data["name"]:
			$Sprite2D/IdleAnimation.play("hello")
		super(event)
		
func _on_interaction_area_body_entered(body: Node2D) -> void:
	if Global.story_act == 1:
		$Sprite2D/InteractionPrompt.visible = false
	else:
		super(body)
	
func _on_interaction_area_body_exited(body: Node2D) -> void:
	super(body)
	$Sprite2D/IdleAnimation.play("goodbye")
	$Sprite2D/IdleAnimation.sprite_frames.set_animation_loop("idle", false)
