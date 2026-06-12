extends CharacterBody2D

const SPEED = 700.0
var screen_size
var move := Vector2.ZERO
@onready var audio_player = $AudioStreamPlayer2D
	
func _ready() -> void: 
	if Global.story_act == 3:
		audio_player.stop()
		audio_player = $AudioStreamPlayer2D2
		
	screen_size = get_viewport_rect().size
	audio_player.finished.connect(_on_finished)
	
	audio_player.play()
	
func _on_finished():
	audio_player.play()
	
func update_movement() -> void:
	move.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left") 
	move.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up") 
	
func update_animation() -> void:
	var direction := move.normalized()
	
	if move == 	Vector2.ZERO:
		$AnimatedSprite2D.frame = 0
		return
	
	if abs(direction.x) > abs(direction.y):
		if direction.x > 0:
			$AnimatedSprite2D.play("walking_right_package" if Global.has_package else "walking_right")	
		else:
			$AnimatedSprite2D.play("walking_left_package" if Global.has_package else "walking_left")
	else:
		if direction.y > 0:
			$AnimatedSprite2D.play("walking_front_package" if Global.has_package else "walking_front")
		else:
			$AnimatedSprite2D.play("walking_back_package" if Global.has_package else "walking_back")
	
func _input(event) -> void:
	update_movement()

func _physics_process(delta: float) -> void:
	if not Global.can_move:
		$AnimatedSprite2D.stop()
		velocity = Vector2.ZERO # Optional: stops sliding momentum
		move_and_slide()
		return
		
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")	
	velocity = direction * SPEED
	update_animation()
	move_and_slide()
