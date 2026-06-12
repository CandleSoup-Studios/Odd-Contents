extends Node2D

var quest_key = "quests_act_%d" % Global.story_act
@onready var SceneTransitionAnimation = $TitleScreenSceneTransitionAnimation/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$TileMap/Player.global_position = $StartPosition.global_position
	
	if Global.story_act == 1:
		Global.current_quest = Global.quests_act_1.pop_front()

		$CanvasLayer.visible = true
		$CanvasLayer/HUD/Container/MarginContainer/HUDLabel.text = "[i][b]Meet Aunt![/b][/i]" + "[br][i]Head to Great Aunt Lourde's House[/i]"
	elif Global.story_act == 2:
		print("READY KEY SIZE", Global[quest_key].size())
		print("READY QUEST KEY", quest_key)
		Global.current_quest = Global[quest_key].pop_front()
		print("READY current quest", Global.current_quest)

		$TileMap/TileAct2Bg.visible = true
		$TileMap/TileAct2.visible = true
		$CanvasLayer.visible = true
		$CanvasLayer/HUD/Container/MarginContainer/HUDLabel.text = "[i][b]Another Day[/b][/i]" + "[br][i]Head to Shade Delivery Co.[/i]"
	elif Global.story_act == 3:
		Global.current_quest = Global[quest_key].pop_front()
		$OrionVonDoom.visible = true
		$TileMap/TileAct3Bg.visible = true
		$TileMap/TileAct3.visible = true
		$CanvasLayer.visible = true
		$CanvasLayer/HUD/Container/MarginContainer/HUDLabel.text = "[i][b]Again...[/b][/i]" + "[br][i]Head to Shade Delivery Co.[/i]"
	
	get_node(Global.current_quest.npc + "/Sprite2D/ObjectiveMarker").visible = true
	get_node(Global.current_quest["npc"] + "/Sprite2D/InteractionPrompt").visible = false
	
	Dialogic.signal_event.connect(_on_signal)


func _on_signal(signal_passed_in):
	match signal_passed_in:
		"hud_update":
			Global.can_dialogue = true
			Global.can_move = true
			get_node(Global.current_quest.npc + "/AnimationPlayer").play("fade_out")
			await get_tree().create_timer(1).timeout
			
			print("curr npc obj mark: ", Global.current_quest.npc)
			get_node(Global.current_quest.npc + "/Sprite2D/ObjectiveMarker").visible = false
			get_node(Global.current_quest["npc"] + "/Sprite2D/InteractionPrompt").visible = false
			print("curr qk: " + str(quest_key))
			print("quest key size: " + str(Global[quest_key].size()))
			if(Global[quest_key].size() > 0):
				Global.current_quest = Global[quest_key].pop_front()
				get_node(Global.current_quest["npc"] + "/Sprite2D/ObjectiveMarker").visible = true
				get_node(Global.current_quest["npc"] + "/Sprite2D/InteractionPrompt").visible = false
			
					
			$CanvasLayer.visible = true
			$CanvasLayer/HUD/Container/MarginContainer/HUDLabel.text = "[i][b]" + Global.hud_display_title + "[/b][/i]" + "[br][i]Head to " + Global.hud_display_location + "[/i]"
		"hud_hide":
			Global.can_dialogue = false
			Global.can_move = false
			$CanvasLayer.visible = false
		"hud_show":
			Global.can_dialogue = true
			Global.can_move = true
			$CanvasLayer.visible = true
		"game_over":
			SceneTransitionAnimation.play("fade_in")
			await SceneTransitionAnimation.animation_finished
			get_tree().change_scene_to_file("res://levels/act1_end.tscn")
			SceneTransitionAnimation.play("fade_out")
			await SceneTransitionAnimation.animation_finished
