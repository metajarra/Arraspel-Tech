extends Node
class_name SignalBus

# TO DO: add args

func _add_signal_with_name(signal_name : String) -> void:
	for item in get_signal_list():
		if item.name == signal_name:
			return
	
	add_user_signal(signal_name)

func _receive_signal_call(signal_name : String) -> void:
	emit_signal(signal_name)

func register_emitter_signal(signal_to_connect : Signal, signal_name : String) -> void:
	_add_signal_with_name(signal_name)
	signal_to_connect.connect(_receive_signal_call)

func register_observer_method(signal_name : String, method_to_connect : Callable) -> void:
	_add_signal_with_name(signal_name)
	connect(signal_name, method_to_connect)
