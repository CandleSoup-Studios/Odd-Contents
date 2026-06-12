class_name NpcInteraction

extends StaticBody2D

@onready var interaction_prompt = $Sprite2D/InteractionPrompt2
var player_in_range = false;
var camera_position: Vector2
var camera_zoom: Vector2

func _on_interaction_area_body_entered(body: Node2D) -> void:
	print("entered!")
	if body.is_in_group("player"):
		if Global.current_quest["npc"] != get_npc_name():
			interaction_prompt.visible = true
		player_in_range = true

func _on_interaction_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		interaction_prompt.visible = false
		$Sprite2D/InteractionPrompt.visible = false
		player_in_range = false
		
func zoom_camera(target_pos: Vector2, target_zoom: Vector2, duration := 0.5):
	var overworld = get_tree().current_scene
	var overworld_camera = overworld.get_node("TileMap/Player/Camera2D")
	camera_position = overworld_camera.global_position
	camera_zoom = overworld_camera.zoom
	var tween = overworld_camera.create_tween()
	
	tween.tween_property(overworld_camera, "global_position", target_pos, duration)
	tween.tween_property(overworld_camera, "zoom", target_zoom, duration)

func zoom_out_camera():
	zoom_camera(camera_position, camera_zoom, 0.4)
		
func get_npc_name() -> String:
	return ""
	
func get_npc_quest_triggered() -> bool:
	return false
	
func set_npc_quest_trigger() -> void:
	print("changing quest trigger for: " + Global.current_quest["prev_npc"])
	get_node("/root/Overworld/" + Global.current_quest["prev_npc"]).npc_data["quest_triggered"] = true

func _input(event) -> void:
	if player_in_range and Input.is_action_just_pressed("dialogue_interaction") and Global.can_dialogue:
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
			
			$Sprite2D/ObjectiveMarker.visible = false
			
			Global.dialogue_node = Dialogic.start("npc_" + npc_name.to_lower() +"_" + str(Global.QuestState.keys()[Global.current_quest["quest_type"]]).to_lower() + "_" + str(Global.story_act))
			#add_child(Global.dialogue_node)	
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
