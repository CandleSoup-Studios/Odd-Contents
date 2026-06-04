extends NpcInteraction

var npc_data = {
	"name": "CindySuzyLou",
	"met": false,
	"quest_role": Global.QuestRole.PICKUP
}

func _input(event) -> void:
	if player_in_range and Input.is_action_just_pressed("dialogue_interaction"):
		if Global.current_quest["npc"] == npc_data["name"]:
			if Global.current_quest["quest_type"] == Global.QuestState.PACKAGE_PICKED:
				print("npc_cindy_pickup_" + str(Global.story_act))
				
				npc_data["quest_role"] = Global.QuestRole.NONE
				Global.current_quest_state = Global.QuestState.PACKAGE_PICKED
				Dialogic.start("npc_cindy_pickup_" + str(Global.story_act))
				
				await Dialogic.timeline_ended
		else: # delete if we don't implement 
				print("generic dialogue!")
			
