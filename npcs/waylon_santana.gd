extends NpcInteraction

var npc_data = {
	"name": "WaylonSantana"
}

func _input(event) -> void:
	if player_in_range and Input.is_action_just_pressed("dialogue_interaction"):
		if Global.current_quest["npc"] == npc_data["name"]:
			print("npc_santna_" + str(Global.QuestState.keys()[Global.current_quest["quest_type"]]).to_lower() + str(Global.story_act))
			
			Dialogic.start("npc_santana_" + str(Global.QuestState.keys()[Global.current_quest["quest_type"]]).to_lower() + "_" + str(Global.story_act))
			await Dialogic.timeline_ended
		else: # delete if we don't implement 
			print("generic dialogue!")
			
