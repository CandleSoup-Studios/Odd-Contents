extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.has_package:
		if Input.is_action_pressed("move_right"):
			$AnimatedSprite2D.play("walking_right_package")
		if Input.is_action_pressed("move_down"):
			$AnimatedSprite2D.play("walking_front_package")
		if Input.is_action_pressed("move_left"):
			$AnimatedSprite2D.play("walking_left_package")
		if Input.is_action_pressed("move_up"):
			$AnimatedSprite2D.play("walking_back_package")
			
		if Input.is_action_just_released("move_right"):
			$AnimatedSprite2D.play("idle_right_package")
		if Input.is_action_just_released("move_down"):
			$AnimatedSprite2D.play("idle_front_package")
		if Input.is_action_just_released("move_left"):
			$AnimatedSprite2D.play("idle_left_package")
		if Input.is_action_just_released("move_up"):
			$AnimatedSprite2D.play("idle_back_package")
	else:
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
