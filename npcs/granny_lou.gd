extends NpcInteraction

var npc_data = {
	"name": "GrannyLou",
	"met": false,
	"quest_role": Global.QuestRole.DELIVERY
}

func _input(event) -> void:
	if player_in_range and Input.is_action_just_pressed("dialogue_interaction"):
		if Global.current_quest["npc"] == npc_data["name"]:
			if Global.current_quest["quest_type"] == Global.QuestState.PACKAGE_DELIVERED:
				print("npc_granny_delivery_" + str(Global.story_act))
				
				npc_data["quest_role"] = Global.QuestRole.NONE
				Global.current_quest_state = Global.QuestState.PACKAGE_DELIVERED
				Dialogic.start("npc_granny_delivery_" + str(Global.story_act))
				
				await Dialogic.timeline_ended
		else: # delete if we don't implement 
			print("generic dialogue!")
			
