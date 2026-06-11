extends NpcInteraction

var npc_data = {
	"name": "WaylonSantana",
	"quest_triggered": false
}

func get_npc_name() -> String:
	return npc_data["name"]

func get_npc_quest_triggered() -> bool:
	return npc_data["quest_triggered"]
