extends Menu

func _ready() -> void:
	super()
	
	if not InputManager.is_input_map_active(_input_map):
		InputManager.change_input_map(_input_map)
	buttons[_curr_button].disabled = false

func _handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_down") or event.is_action_pressed("ui_up"):
		var dir: int = 0 
		dir += 1 if event.is_action_pressed("ui_down") else 0
		dir -= 1 if event.is_action_pressed("ui_up") else 0
		var new_button: int = clampi(_curr_button + dir, 0, len(buttons) - 1)
		
		buttons[_curr_button].disabled = true
		
		_curr_button = new_button
		buttons[_curr_button].disabled = false
	
	if event.is_action_pressed("ui_accept"):
		var curr_button_id: String = buttons[_curr_button].button_id
		match curr_button_id:
			"play":
				print("TODO: Load game.")
			"settings":
				disconnect_input()
				get_tree().change_scene_to_file("res://_Scenes/SettingsMenu/settings_menu.tscn")
			"exit":
				get_tree().quit()
			_:
				print("Invalid button id in %s!" % name)
