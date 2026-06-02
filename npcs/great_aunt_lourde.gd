extends NpcInteraction

var npc_data = {
	"name": "Great Aunt Lourde",
	"met": false,
	"quest_role": Global.QuestRole.NONE
}

var has_interacted = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event) -> void:
	if Input.is_action_just_pressed("dialogue_interaction") and !has_interacted:
		has_interacted = true
		
		print(Global.hud_display) 
		
		if !npc_data.get("met"):
			Dialogic.start("npc_aunt_intro")
			npc_data.set("met", true)
			
			await Dialogic.timeline_ended
