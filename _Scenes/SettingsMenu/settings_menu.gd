extends Menu

func _handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://_Scenes/MainMenu/main_menu.tscn")
