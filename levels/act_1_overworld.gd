extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Player.global_position = $StartPosition.global_position
	#Dialogic.signal_event.connect(_on_signal)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
