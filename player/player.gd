extends CharacterBody2D

const SPEED = 1000.0
var screen_size
var move := Vector2.ZERO

func _ready() -> void: 
	screen_size = get_viewport_rect().size
	
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
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED

	update_animation()
	move_and_slide()
