extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Player.global_position = $StartPosition.global_position
	Dialogic.signal_event.connect(_on_signal)

func _on_signal(signal_passed_in):
	match signal_passed_in:	
		"hud_update":
			$CanvasLayer.visible = true
			$CanvasLayer/HUD/HUDBackground/HUDLabelTitle.text = "[i]" + Global.hud_display_title + "[/i]"
			$CanvasLayer/HUD/HUDBackground/HUDLabelLocation.text = "[i]Head to " + Global.hud_display_location + "[/i]"
		"hud_hide":
			$CanvasLayer.visible = false
