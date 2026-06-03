extends Node

enum QuestState {
	NOT_STARTED,
	STARTED,
	PACKAGE_PICKED,
	PACKAGE_DELIVERED,
	COMPLETED
}
enum QuestRole {
	NONE,
	QUEST_NPC,
	PICKUP,
	DELIVERY
}

var story_act = 1
var hud_display_title = ""
var hud_display_location = ""
var current_quest_state = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
