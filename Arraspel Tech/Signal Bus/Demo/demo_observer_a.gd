extends Node

@export var signal_bus : SignalBus

func _ready() -> void:
	signal_bus.register_observer_method("button_pressed", _on_button_pressed, "name")

func _on_button_pressed(button_name : String) -> void:
	print("Button %s pressed" % button_name)
