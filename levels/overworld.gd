extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$TileMap/Player.global_position = $StartPosition.global_position
	Global.current_quest = Global.quests_act_1.pop_front()

	$CanvasLayer.visible = true
	$CanvasLayer/HUD/Container/HUDLabel.text = "[i]Meet Granny![/i]" + "[br][font_size=14][i]Head to Great Aunt Lourde's House[/i][/font_size]"
	
	get_node(Global.current_quest.npc + "/ObjectiveMarker").visible = true
	
	Dialogic.signal_event.connect(_on_signal)

func _on_signal(signal_passed_in):
	match signal_passed_in:
		"hud_update":
			get_node(Global.current_quest.npc + "/ObjectiveMarker").visible = false
			
			if(Global.quests_act_1.size() > 0):
				Global.current_quest = Global.quests_act_1.pop_front()
				get_node(Global.current_quest.npc + "/ObjectiveMarker").visible = true
			else:
				get_node("GreatAuntLourde/ObjectiveMarker").visible = true
			
			$CanvasLayer.visible = true
			$CanvasLayer/HUD/Container/HUDLabel.text = "[i]" + Global.hud_display_title + "[/i]" + "[br][font_size=14][i]Head to " + Global.hud_display_location + "[/i][/font_size]"
			#$CanvasLayer/HUD/HUDBackground/HUDLabelLocation.text = "[i]Head to " + Global.hud_display_location + "[/i]"
		"hud_hide":
			$CanvasLayer.visible = false
