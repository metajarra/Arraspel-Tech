extends Node
class_name TurnManager

@onready var signal_bus : SignalBus = $"../Signal Bus"

signal global_turn_triggered
var turn_count := 0

func _ready() -> void:
	signal_bus.register_emitter_signal(global_turn_triggered, "global_turn_triggered", turn_count)
	signal_bus.register_observer_method("global_turn_called", _on_global_turn_called)

func _on_global_turn_called() -> void:
	turn_count += 1
	global_turn_triggered.emit("global_turn_triggered", turn_count)
