extends GutTest

func test_type_names() -> void:
	assert_eq(Type.get_type_name("Hello world!"), "String")
	assert_eq(Type.get_type_name(42), "int")
