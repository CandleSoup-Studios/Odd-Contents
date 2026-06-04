extends Node

enum QuestState {
	NOT_STARTED,
	STARTED,
	PACKAGE_PICKED,
	PACKAGE_DELIVERED,
	COMPLETED,
	END
}
enum QuestRole {
	NONE,
	QUEST_NPC,
	PICKUP,
	DELIVERY
}

var quests_act_1 = [
	{"quest_type": QuestState.NOT_STARTED, "npc": "GreatAuntLourde"},
	{"quest_type": QuestState.STARTED, "npc": "WaylonSantana"},
	{"quest_type": QuestState.PACKAGE_PICKED, "npc": "CindySuzyLou"},
	{"quest_type": QuestState.PACKAGE_DELIVERED, "npc": "GrannyLou"},
	{"quest_type": QuestState.COMPLETED, "npc": "WaylonSantana"},
	{"quest_type": QuestState.END, "npc": "GreatAuntLourde"}
]

var story_act = 1
var hud_display_title = ""
var hud_display_location = ""
var current_quest_state = QuestState.NOT_STARTED
var current_quest = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
