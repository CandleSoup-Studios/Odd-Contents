extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$TileMap/Player.global_position = $StartPosition.global_position
	Dialogic.signal_event.connect(_on_signal)

func _on_signal(signal_passed_in):
	match signal_passed_in:	
		"hud_update":
			$CanvasLayer.visible = true
			
			$CanvasLayer/HUD/Container/HUDLabel.text = "[i]" + Global.hud_display_title + "[/i]" + "[br][font_size=14][i]Head to " + Global.hud_display_location + "[/i][/font_size]"
			#$CanvasLayer/HUD/HUDBackground/HUDLabelLocation.text = "[i]Head to " + Global.hud_display_location + "[/i]"
		"hud_hide":
			$CanvasLayer.visible = false
