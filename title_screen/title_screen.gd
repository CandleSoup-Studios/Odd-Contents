extends MarginContainer

@onready var SceneTransitionAnimation = $TitleScreenSceneTransitionAnimation/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_new_game_pressed() -> void:
	SceneTransitionAnimation.play("fade_in")
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://levels/overworld.tscn")

func _on_load_game_pressed() -> void:
	#get_tree().change_scene_to_file("")
	pass # Replace with function body.

func _on_settings_pressed() -> void:
	#get_tree().change_scene_to_file("")
	pass # Replace with function body.

func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_credits_pressed() -> void:
	#get_tree().change_scene_to_file("")
	pass # Replace with function body.
