extends Node

enum QuestState {
	INTRO,
	START,
	PACKAGE_PICKUP,
	PACKAGE_DELIVERY,
	COMPLETE,
	END
}

var quests_act_1 = [
	{"quest_type": QuestState.INTRO, "npc": "GreatAuntLourde", "prev_npc": null},
	{"quest_type": QuestState.START, "npc": "WaylonSantana", "prev_npc": "GreatAuntLourde"},
	{"quest_type": QuestState.PACKAGE_PICKUP, "npc": "CindySuzyLou", "prev_npc": "WaylonSantana"},
	{"quest_type": QuestState.PACKAGE_DELIVERY, "npc": "GrannyLou", "prev_npc": "CindySuzyLou"},
	{"quest_type": QuestState.COMPLETE, "npc": "WaylonSantana", "prev_npc": "GrannyLou"},
	{"quest_type": QuestState.END, "npc": "GreatAuntLourde", "prev_npc": "WaylonSantana"}
]

var quests_act_2 = [
	{"quest_type": QuestState.START, "npc": "WaylonSantana", "prev_npc": null},
	{"quest_type": QuestState.PACKAGE_PICKUP, "npc": "RemingtonHolloway", "prev_npc": "WaylonSantana"},
	{"quest_type": QuestState.PACKAGE_DELIVERY, "npc": "HarveyJakes", "prev_npc": "RemingtonHolloway"},
	{"quest_type": QuestState.COMPLETE, "npc": "WaylonSantana", "prev_npc": "HarveyJakes"},
	{"quest_type": QuestState.END, "npc": "GreatAuntLourde", "prev_npc": "WaylonSantana"}
]

var quests_act_3 = [
	{"quest_type": QuestState.START, "npc": "WaylonSantana", "prev_npc": null},
	{"quest_type": QuestState.PACKAGE_PICKUP, "npc": "LucillePope", "prev_npc": "WaylonSantana"},
	{"quest_type": QuestState.PACKAGE_DELIVERY, "npc": "OrionVonDoom", "prev_npc": "LucillePope"},
	{"quest_type": QuestState.COMPLETE, "npc": "WaylonSantana", "prev_npc": null},
	{"quest_type": QuestState.END, "npc": "GreatAuntLourde", "prev_npc": null}
]

var story_act = 1
var hud_display_title = ""
var hud_display_location = ""
var current_quest = 	{"quest_type": QuestState.INTRO, "npc": "GreatAuntLourde", "prev_npc": null}
var has_package = false
var dialogue_node: Node = null;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
