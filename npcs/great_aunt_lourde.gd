extends NpcInteraction

var npc_data = {
	"name": "GreatAuntLourde"
}

func _input(event) -> void:
	if player_in_range and Input.is_action_just_pressed("dialogue_interaction"):
		if Global.current_quest["npc"] == npc_data["name"]:
			if Global.current_quest["quest_type"] == Global.QuestState.END:
				Global.story_act += 1
				#Global.hud_display_title = "" should be done elsewhere, start day with NEW HUD prompt
				#Global.hud_display_location = "" should be done elsewhere, start day with new HUD prompt
				#Global.current_quest_state = Global.QuestState.INTRO
				#Global.current_quest = {}
				get_tree().change_scene_to_file("res://levels/act1_end.tscn")
			else:
				Dialogic.start("npc_aunt_" + str(Global.QuestState.keys()[Global.current_quest["quest_type"]]).to_lower())
				await Dialogic.timeline_ended
		else: # delete if we don't implement 
			print("generic dialogue!")
