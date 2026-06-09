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
		$Sprite2D/IdleAnimation.play("hello")
		super(event)
	
func _on_interaction_area_body_exited(body: Node2D) -> void:
	super(body)
	$Sprite2D/IdleAnimation.play("goodbye")
	$Sprite2D/IdleAnimation.sprite_frames.set_animation_loop("idle", false)
