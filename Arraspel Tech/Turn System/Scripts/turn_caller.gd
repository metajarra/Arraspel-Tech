extends Node

@onready var signal_bus : SignalBus = $"/root/TurnSystem/Signal Bus"

signal global_turn_called

func _ready() -> void:
	signal_bus.register_emitter_signal(global_turn_called, "global_turn_called")

func call_global_turn() -> void:
	global_turn_called.emit()
