extends NpcInteraction

var npc_data = {
	"name": "WaylonSantana",
	"met": false,
	"quest_role": Global.QuestRole.QUEST_NPC
}

func _input(event) -> void:
	if player_in_range and Input.is_action_just_pressed("dialogue_interaction"):
		if Global.current_quest["npc"] == npc_data["name"]:
			if Global.current_quest["quest_type"] == Global.QuestState.STARTED:
				print("npc_santna_" + str(Global.story_act))
				
				Global.current_quest_state = Global.current_quest["quest_type"]
				Dialogic.start("npc_santana_start_" + str(Global.story_act))
				
				await Dialogic.timeline_ended
			elif Global.current_quest["quest_type"] == Global.QuestState.COMPLETED:
				print("npc_sanatna_complete_" + str(Global.story_act))
				Dialogic.start("npc_santana_complete_" + str(Global.story_act))
		else: # delete if we don't implement 
			print("generic dialogue!")
			
