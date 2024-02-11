extends Node

@export_file("*.tres") var event_to_trigger : String
@onready var _event : Event = load(event_to_trigger)

func trigger_event() -> void:
	print(_event.title)
