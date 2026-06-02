extends Node

enum QuestState {
	NOT_STARTED,
	STARTED,
	PACKAGED_PICKED,
	PACKAGE_DELIVERED,
	COMPLETED
}
enum QuestRole {
	NONE,
	QUEST_NPC,
	PICKUP,
	DELIVERY
}

var story_act = 1;
var hud_display = "";
var current_quest_state = QuestState.NOT_STARTED

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
