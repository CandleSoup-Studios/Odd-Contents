extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Player.global_position = $StartPosition.global_position
	Dialogic.signal_event.connect(_on_signal)

func _on_signal(signal_passed_in):
	match signal_passed_in:
		"package_pickup":
			print("package picked up by Bex!")
			#Global.hasDeliveryQuest = true
			$Pickup1/CollisionShape2D.disabled = true
			
		"package_delivered":
			print("package delivered by Bex!")
			$Delivery1/CollisionShape2D.disabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_pickup1_body_entered(body: Node2D) -> void:
	print("quest picked up")
	Dialogic.start("pickup1")
	
func _on_delivery_1_body_entered(body: Node2D) -> void:
	print("quest delivered")
	Dialogic.start("delivery1")
