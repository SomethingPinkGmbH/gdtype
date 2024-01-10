class_name ClassTest
extends GutTest

func test_class_name() -> void:
	assert_eq(Class.get_string_name(ClassTest), "ClassTest")
	assert_eq(Class.get_string_name(ClassDB), "ClassDB")
	assert_eq(Class.get_string_name(GDScript), "GDScript")
	
	# Godot doesn't expose inner class names
	assert_eq(Class.get_string_name(InnerTestClass), Class.UNKNOWN_CLASS_NAME)

func test_class_object() -> void:
	@warning_ignore("unsafe_call_argument")
	assert_eq(Class.get_object_class(self), ClassTest)

	var test_node: Node = Node.new()
	@warning_ignore("unsafe_call_argument")
	assert_eq(Class.get_object_class(test_node), Node)
	test_node.free()

	# Godot doesn't expose inner class names
	@warning_ignore("unsafe_call_argument")
	assert_null(Class.get_object_class(InnerTestClass.new()))

func test_get_variable_class_or_type_name() -> void:
	assert_eq(Class.get_variable_class_or_type_name(self), "ClassTest")
	assert_eq(Class.get_variable_class_or_type_name(""), "String")

class InnerTestClass:
	pass
