extends Node

func _ready() -> void:
	var descendants : Array = _get_all_descendants((self))
	print(descendants)
	print(descendants.size())

func _get_all_descendants(parent : Node, include_self : bool = false) -> Array:
	var descendants : Array
	if include_self:
		descendants.append(parent)
	
	var children : Array = parent.get_children()
	for child in children:
		var child_descendants : Array = _get_all_descendants(child, true)
		for descendant in child_descendants:
			descendants.append(descendant)
	
	return descendants
