extends Control

@onready var SceneTransitionAnimation = $TitleScreenSceneTransitionAnimation/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	SceneTransitionAnimation.play("fade_in")
	await SceneTransitionAnimation.animation_finished
	get_tree().change_scene_to_file("res://title_screen/title_screen.tscn")
	SceneTransitionAnimation.play("fade_out")
	await SceneTransitionAnimation.animation_finished
