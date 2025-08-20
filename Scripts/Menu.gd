class_name Menu extends CanvasLayer

@export var _input_map: Utils.INPUT_MAP

@export var buttons: Array[CustomButton]
var _curr_button: int = 0

func _ready() -> void:
	SignalBus.input_map_changed.connect(_on_input_map_changed)
	
	if InputManager.is_input_map_active(_input_map):
		connect_input()

func _on_input_map_changed(new_map: Utils.INPUT_MAP) -> void:
	if new_map == _input_map:
		connect_input()
	else:
		disconnect_input()

func connect_input() -> void:
	SignalBus.input_processed.connect(_handle_input)

func disconnect_input() -> void:
	SignalBus.input_processed.disconnect(_handle_input)

func _handle_input(_event: InputEvent) -> void:
	pass
