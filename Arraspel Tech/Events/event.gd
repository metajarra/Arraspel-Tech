extends Resource
class_name Event

@export_category("Event Info")
@export var title : String
@export_multiline var description : String
## Please use Strings for keys and EventEffects for values
@export var options_and_effects : Dictionary

@export_category("Event Metadata")
@export var can_repeat := true
@export var can_be_called_randomly := true
