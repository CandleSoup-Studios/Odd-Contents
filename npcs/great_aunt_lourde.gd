extends NpcInteraction

var npc_data = {
	"name": "GreatAuntLourde",
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
			
		elif Global.current_quest["quest_type"] == Global.QuestState.END:
			get_tree().change_scene_to_file("res://levels/act1_end.tscn")
		else: # delete if we don't implement 
			
			print("generic dialogue!")
