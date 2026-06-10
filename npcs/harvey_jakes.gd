extends NpcInteraction

var npc_data = {
	"name": "HarveyJakes"
}

func get_npc_name() -> String:
	return npc_data["name"]
	
func _ready():
	$Sprite2D/IdleAnimation.animation_finished.connect(_on_idle_animation_finished)
	
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
	#override parent, only wnat dialogue to show when u actually can talk to him
	if Global.current_quest["npc"] == npc_data["name"]:
		if body.is_in_group("player"):
			interaction_prompt.visible = true
			player_in_range = true
	
func _on_interaction_area_body_exited(body: Node2D) -> void:
	super(body)
	$Sprite2D/IdleAnimation.play("goodbye")
	$Sprite2D/IdleAnimation.sprite_frames.set_animation_loop("idle", false)
