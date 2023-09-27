extends Node

@export var signal_bus : SignalBus

func _ready() -> void:
	signal_bus.register_observer_method("button_pressed", _on_button_pressed)

func _on_button_pressed() -> void:
	print("Button %s pressed" % "temp")
