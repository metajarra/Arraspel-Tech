extends Node
class_name SceneChanger

static var _is_scene_loading := false

## The scene this node will load when activated
@export_file("*.tscn") var scene_to_load : String

func load_scene() -> void:
	if _is_scene_loading:
		push_warning("Scene Changer %s tried to load a scene while another scene was being loaded" \
		% name)
		return
	
	_is_scene_loading = true
	
	set_process(true)
	
	call_deferred("_deferred_load_scene", scene_to_load)

func _deferred_load_scene(scene : String) -> void:
	get_tree().change_scene_to_file(scene)
	_is_scene_loading = false
