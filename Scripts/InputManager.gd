extends Node

var _curr_input_map: Utils.INPUT_MAP

func _input(event: InputEvent) -> void:
	SignalBus.input_processed.emit(event)

func change_input_map(new_map: Utils.INPUT_MAP) -> void:
	_curr_input_map = new_map
	SignalBus.input_map_changed.emit(_curr_input_map)

func is_input_map_active(map_to_check: Utils.INPUT_MAP) -> bool:
	return map_to_check == _curr_input_map
