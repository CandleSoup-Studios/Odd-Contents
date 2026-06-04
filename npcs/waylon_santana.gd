extends NpcInteraction

var npc_data = {
	"name": "Waylon Santana",
	"met": false,
	"quest_role": Global.QuestRole.QUEST_NPC
}

func _input(event) -> void:
	if player_in_range and Input.is_action_just_pressed("dialogue_interaction"):
		if Global.current_quest_state == Global.QuestState.NOT_STARTED and npc_data["quest_role"] == Global.QuestRole.QUEST_NPC:
			print("npc_santna_" + str(Global.story_act))
			
			npc_data["quest_role"] = Global.QuestRole.NONE
			Global.current_quest_state = Global.QuestState.STARTED
			Dialogic.start("npc_santana_start_" + str(Global.story_act))
			
			await Dialogic.timeline_ended
		elif Global.current_quest_state == Global.QuestState.PACKAGE_DELIVERED:
			print("npc_sanatna_complete_" + str(Global.story_act))
			Dialogic.start("npc_santana_complete_" + str(Global.story_act))
		else: # delete if we don't implement 
			print("generic dialogue!")
			
