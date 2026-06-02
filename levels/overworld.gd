extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Player.global_position = $StartPosition.global_position
	Dialogic.signal_event.connect(_on_signal)

func _on_signal(signal_passed_in):
	match signal_passed_in:	
		"hud_update":
			$CanvasLayer.visible = true
			$CanvasLayer/HUD/HUDBackground/HUDLabel.text = Global.hud_display

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_pickup1_body_entered(body: Node2D) -> void:
	print("quest picked up")
	Dialogic.start("pickup1")
	
func _on_delivery_1_body_entered(body: Node2D) -> void:
	print("quest delivered")
	Dialogic.start("delivery1")
