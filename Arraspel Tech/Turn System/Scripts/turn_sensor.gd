extends Node

@onready var signal_bus : SignalBus = $"/root/TurnSystem/Signal Bus"

signal turn_triggered

func _ready() -> void:
	signal_bus.register_observer_method("next_turn_triggered", _on_next_turn_triggered, -1)

func _on_next_turn_triggered(turn_count : int) -> void:
	turn_triggered.emit(turn_count)
