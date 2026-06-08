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
	{"quest_type": QuestState.INTRO, "npc": "GreatAuntLourde"},
	{"quest_type": QuestState.START, "npc": "WaylonSantana"},
	{"quest_type": QuestState.PACKAGE_PICKUP, "npc": "CindySuzyLou"},
	{"quest_type": QuestState.PACKAGE_DELIVERY, "npc": "GrannyLou"},
	{"quest_type": QuestState.COMPLETE, "npc": "WaylonSantana"},
	{"quest_type": QuestState.END, "npc": "GreatAuntLourde"}
]

var quests_act_2 = [
	#{"quest_type": QuestState.NOT_STARTED, "npc": "GreatAuntLourde"},
	{"quest_type": QuestState.START, "npc": "WaylonSantana"},
	{"quest_type": QuestState.PACKAGE_PICKUP, "npc": "RemingtonHolloway"},
	{"quest_type": QuestState.PACKAGE_DELIVERY, "npc": "HarveyJakes"},
	{"quest_type": QuestState.COMPLETE, "npc": "WaylonSantana"},
	{"quest_type": QuestState.END, "npc": "GreatAuntLourde"}
]

var quests_act_3 = [
	#{"quest_type": QuestState.NOT_STARTED, "npc": "GreatAuntLourde"},
	{"quest_type": QuestState.START, "npc": "WaylonSantana"},
	{"quest_type": QuestState.PACKAGE_PICKUP, "npc": "LucillePope"},
	{"quest_type": QuestState.PACKAGE_DELIVERY, "npc": "OrionVonDoom"},
	{"quest_type": QuestState.COMPLETE, "npc": "WaylonSantana"},
	{"quest_type": QuestState.END, "npc": "GreatAuntLourde"}
]

var story_act = 1
var hud_display_title = ""
var hud_display_location = ""
#var current_quest_state = QuestState.INTRO
var current_quest = 	{"quest_type": QuestState.INTRO, "npc": "GreatAuntLourde"}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
