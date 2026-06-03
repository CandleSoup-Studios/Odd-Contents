extends NpcInteraction

var npc_data = {
	"name": "Great Aunt Lourde",
	"met": false,
	"quest_role": Global.QuestRole.NONE
}

func _input(event) -> void:
	if player_in_range and Input.is_action_just_pressed("dialogue_interaction"):
		if !npc_data.get("met"):
			Dialogic.start("npc_aunt_intro")
			npc_data.set("met", true)
			Global.current_quest_state = Global.QuestState.NOT_STARTED
			
			await Dialogic.timeline_ended
		else: # delete if we don't implement 
			print("generic dialogue!")
