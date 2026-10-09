extends CollisionShape2D


#var root_node = get_parent()
#var jermatxt =root_node.get_node("jermatext")

#var posTo : jermatxt.global_position


func _process(delta: float) -> void:
	pass
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		print("holo")
		
		
#func _physics_process(delta: float) -> void:
	#var vel = ()
