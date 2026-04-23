extends CharacterBody2D

const SPEED = 300.0
var screen_size
#const JUMP_VELOCITY = -400.0

func _ready() -> void: 
	screen_size = get_viewport_rect().size
	
func _input(event) -> void:
	if Input.is_action_pressed("move_right"):
		$AnimatedSprite2D.play("walking_right")
	if Input.is_action_pressed("move_down"):
		$AnimatedSprite2D.play("walking_front")
	if Input.is_action_pressed("move_left"):
		$AnimatedSprite2D.play("walking_left")
	if Input.is_action_pressed("move_up"):
		$AnimatedSprite2D.play("walking_back")
		
	if Input.is_action_just_released("move_right"):
		$AnimatedSprite2D.play("idle_right")
	if Input.is_action_just_released("move_down"):
		$AnimatedSprite2D.play("idle_front")
	if Input.is_action_just_released("move_left"):
		$AnimatedSprite2D.play("idle_left")
	if Input.is_action_just_released("move_up"):
		$AnimatedSprite2D.play("idle_back")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
	#	velocity += get_gravity() * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED
	position = position.clamp(Vector2.ZERO, screen_size)

	move_and_slide()
