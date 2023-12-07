extends Node

var time_elapsed : float 

func _process(delta: float) -> void:
	time_elapsed += delta
	print(_format_time_float_as_string(time_elapsed * 100))

func _format_time_float_as_string(time : float) -> String:
	var milliseconds = fmod(time, 60)
	var seconds = int(time / 60) % 60
	var minutes = int(time / 3600)
	
	return "%02d:%02d:%02d" % [minutes, seconds, milliseconds]
