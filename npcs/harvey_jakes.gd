extends NpcInteraction

var npc_data = {
	"name": "HarveyJakes"
}

func get_npc_name() -> String:
	return npc_data["name"]
	
func _ready():
	$IdleAnimation.animation_finished.connect(_on_idle_animation_finished)
	
func _on_idle_animation_finished():
	$IdleAnimation.pause()
	
	if $IdleAnimation.animation == "hello":
		$IdleAnimation.play("idle")
	
func _input(event) -> void:
	if player_in_range and Input.is_action_just_pressed("dialogue_interaction"):
		$IdleAnimation.play("hello")
		super(event)
	
func _on_interaction_area_body_exited(body: Node2D) -> void:
	super(body)
	$IdleAnimation.play("goodbye")
	$IdleAnimation.sprite_frames.set_animation_loop("idle", false)
