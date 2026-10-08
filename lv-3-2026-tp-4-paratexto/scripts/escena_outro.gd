extends Control

@export var animator_texto : AnimationPlayer
@export var texto : RichTextLabel

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		print("holo")
