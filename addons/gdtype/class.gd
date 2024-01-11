@tool
class_name Class extends Object

## This is the string returned when the algorithm can't determine the class. This is usually because
## it's an inner or generated class.
const UNKNOWN_CLASS_NAME = "!unknown_class!"

## This function returns the class name or type name of a value.
static func get_variable_class_or_type_name(cls: Variant) -> String:
	var t = typeof(cls)
	if t == TYPE_OBJECT:
		return Class.get_object_class_name(cls)
	return Type.get_string_name(t)

static func get_object_class_name(cls: Variant) -> String:
	var obj_cls = Class.get_object_class(cls)
	if obj_cls == null:
		return UNKNOWN_CLASS_NAME
	return Class.get_string_name(obj_cls)
	

## This function returns the class of an object. If the class cannot be determined
## (e.g. it's an inner class) null is returned.
static func get_object_class(cls: Variant) -> Variant:
	Class._build_classmaps()

	var class_instances: Array = []
	
	var cls_script: Script = cls.get_script()
	if cls_script == null:
		return Class._name_to_class[cls.get_class()]
	
	if !(cls_script in Class._script_to_name):
		return null
	var cls_name = _script_to_name[cls_script]
	if !(cls_name in Class._name_to_class):
		return null
	return Class._name_to_class[cls_name]

## Returns the name of a class (not object) as a string. If the class cannot be determined
## (e.g. it's an inner class), the value of the UNKNOWN_CLASS_NAME constant is returned.
static func get_string_name(cls: Variant) -> String:
	Class._build_classmaps()
	if !(cls in Class._class_to_name):
		return Class.UNKNOWN_CLASS_NAME
	return Class._class_to_name[cls]

## Contains a mapping from classes to their names. For internal use only.
static var _class_to_name: Dictionary = {}
## Contains a mapping from class names to their corresponding class objects. For internal use only.
static var _name_to_class: Dictionary = {}
## Contains a mapping from class names to their corresponding Script instances. For internal use
## only.
static var _name_to_script: Dictionary = {}
## Contains a mapping from Script instances to their primary class name. For internal use only.
static var _script_to_name: Dictionary = {}

## When called the first time, it populates the caching variables with data about classes from the
## Godot engine.
static func _build_classmaps():
	if Class._class_to_name.size() != 0:
		return
	var class_to_name = "@warning_ignore('unused_private_class_variable')\nvar _class_to_name: Dictionary = {"
	var name_to_class = "@warning_ignore('unused_private_class_variable')\nvar _name_to_class: Dictionary = {"
	for cls_name in ClassDB.get_class_list():
		if !ClassDB.can_instantiate(cls_name):
			continue
		class_to_name += cls_name + ': "' + cls_name + '",\n'
		name_to_class += '"' + cls_name + '": ' + cls_name + ',\n'
		
	var config = ConfigFile.new()
	for custom_class in ProjectSettings.get_global_class_list():
		class_to_name += custom_class["class"] + ': "' + custom_class["class"] + '",\n'
		name_to_class += '"' + custom_class["class"] + '": ' + custom_class["class"] + ',\n'
		var class_script: Script = load(str(custom_class["path"]))
		Class._name_to_script[custom_class["class"]] = class_script
		Class._script_to_name[class_script] = custom_class["class"]
	class_to_name += "}"
	name_to_class += "}"
	
	var gen_script: GDScript = GDScript.new()
	gen_script.source_code = class_to_name + "\n" + name_to_class
	gen_script.reload()
	var gen_script_instance = gen_script.new()
	Class._class_to_name = gen_script_instance._class_to_name
	Class._name_to_class = gen_script_instance._name_to_class
