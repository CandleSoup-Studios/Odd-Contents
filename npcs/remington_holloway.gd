extends NpcInteraction

var npc_data = {
	"name": "RemingtonHolloway"
}

func get_npc_name() -> String:
	return npc_data["name"]
	
func _ready():
	$IdleAnimation.animation_finished.connect(_on_idle_animation_finished)
	
func _on_idle_animation_finished():
	$IdleAnimation.pause()
	$IdleAnimation.play("idle")
	
func _input(event) -> void:
	if player_in_range and Input.is_action_just_pressed("dialogue_interaction"):
		$IdleAnimation.play("surprise")
		super(event)
