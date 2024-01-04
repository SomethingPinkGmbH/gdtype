extends GutTest

func test_type_names():
	assert_eq(Type.get_type_name("Hello world!"), "string")
	assert_eq(Type.get_type_name(42), "integer")
