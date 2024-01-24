extends Node

signal button_pressed

@export var signal_bus : SignalBus

func _ready() -> void:
	signal_bus.register_emitter_signal(button_pressed, "button_pressed", name)

func _on_pressed() -> void:
	button_pressed.emit("button_pressed", name)
