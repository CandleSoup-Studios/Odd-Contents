class_name NpcInteraction

extends StaticBody2D

@onready var interaction_prompt = $Sprite2D/InteractionPrompt
var player_in_range = false;

func _on_interaction_area_body_entered(body: Node2D) -> void:
	print("entered!")
	if body.is_in_group("player"):
		if Global.current_quest["npc"] != get_npc_name():
			interaction_prompt.visible = true
		player_in_range = true

func _on_interaction_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		interaction_prompt.visible = false
		player_in_range = false
		
func get_npc_name() -> String:
	return ""
	
func get_npc_quest_triggered() -> bool:
	return false
	
func set_npc_quest_trigger() -> void:
	print("changing quest trigger for: " + Global.current_quest["prev_npc"])
	get_node("/root/Overworld/" + Global.current_quest["prev_npc"]).npc_data["quest_triggered"] = true

func _input(event) -> void:
	if player_in_range and Input.is_action_just_pressed("dialogue_interaction"):
		var npc_name = get_npc_name()
		var npc_quest_triggered = get_npc_quest_triggered()
		print("npc_" + npc_name.to_lower() +"_" + str(Global.QuestState.keys()[Global.current_quest["quest_type"]]).to_lower() + "_" + str(Global.story_act))
		print(Global.current_quest["npc"])
		print(npc_name)
		
		if Global.current_quest["quest_type"] == Global.QuestState.END and Global.current_quest["npc"] == npc_name:
				print("end of act before signal emit")
				Global.story_act += 1
				print(Global.story_act)
				print(get_tree().current_scene)
				var ow = get_tree().current_scene
				print("Has method _on_signal:", ow.has_method("_on_signal"))
				await get_tree().process_frame
				get_tree().current_scene._on_signal("hud_update")

				if Global.story_act == 2:
					get_tree().change_scene_to_file("res://act_transitions/act_2_transition.tscn")
				elif Global.story_act == 3:
					get_tree().change_scene_to_file("res://act_transitions/act_3_transition.tscn")
		elif Global.current_quest["npc"] == npc_name:
			print("inside quest??")
			#print("npc_cindy_pickup_" + str(Global.story_act))
			if Global.current_quest["prev_npc"] != null:
				print("current npc for geneirc" + npc_name)
				print("prev npc for geneirc" + Global.current_quest["prev_npc"])
				set_npc_quest_trigger()
			Dialogic.start("npc_" + npc_name.to_lower() +"_" + str(Global.QuestState.keys()[Global.current_quest["quest_type"]]).to_lower() + "_" + str(Global.story_act))	
			await Dialogic.timeline_ended
		else: # generic dialogue scenes
			if npc_quest_triggered:
				print("after scene")
				Dialogic.start("npc_" + npc_name.to_lower() +"_generic_after_" + str(Global.story_act))
				await Dialogic.timeline_ended
			else: 
				print("before scneee")
				Dialogic.start("npc_" + npc_name.to_lower() +"_generic_before_" + str(Global.story_act))
				await Dialogic.timeline_ended
