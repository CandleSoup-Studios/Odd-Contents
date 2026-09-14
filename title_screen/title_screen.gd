extends MarginContainer

func _on_new_game_pressed() -> void:
	TitleScreenSceneTransitionAnimation.change_scene("res://act_transitions/act_1_transition_scene.tscn")

func _on_load_game_pressed() -> void:
	#get_tree().change_scene_to_file("")
	pass # Replace with function body.

func _on_settings_pressed() -> void:
	#get_tree().change_scene_to_file("")
	pass # Replace with function body.

func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_credits_pressed() -> void:
	pass
