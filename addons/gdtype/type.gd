class_name Type extends Object

static func get_type(variable) -> Variant.Type:
	return typeof(variable)
	
static func get_type_name(variable) -> String:
	return Type.get_string_name(typeof(variable))

static func get_string_name(type: Variant.Type) -> String:
	match type:
		TYPE_AABB:
			return "AABB"
		TYPE_ARRAY:
			return "array"
		TYPE_BASIS:
			return "basis"
		TYPE_BOOL:
			return "bool"
		TYPE_CALLABLE:
			return "callable"
		TYPE_COLOR:
			return "color"
		TYPE_DICTIONARY:
			return "dictionary"
		TYPE_FLOAT:
			return "float"
		TYPE_INT:
			return "integer"
		TYPE_MAX:
			return "max"
		TYPE_NIL:
			return "nil"
		TYPE_NODE_PATH:
			return "node path"
		TYPE_OBJECT:
			return "object"
		TYPE_PACKED_BYTE_ARRAY:
			return "packed byte array"
		TYPE_PACKED_COLOR_ARRAY:
			return "packed color array"
		TYPE_PACKED_FLOAT32_ARRAY:
			return "packed float32 array"
		TYPE_PACKED_FLOAT64_ARRAY:
			return "packed float64 array"
		TYPE_PACKED_INT32_ARRAY:
			return "packed int32 array"
		TYPE_PACKED_INT64_ARRAY:
			return "packed int64 array"
		TYPE_PACKED_STRING_ARRAY:
			return "packed string array"
		TYPE_PACKED_VECTOR2_ARRAY:
			return "packed 2D vector array"
		TYPE_PACKED_VECTOR3_ARRAY:
			return "packed 3D vector array"
		TYPE_PLANE:
			return "plane"
		TYPE_PROJECTION:
			return "projection"
		TYPE_QUATERNION:
			return "quaternion"
		TYPE_RECT2:
			return "rect2"
		TYPE_RECT2I:
			return "rect2i"
		TYPE_RID:
			return "resource ID"
		TYPE_SIGNAL:
			return "signal"
		TYPE_STRING:
			return "string"
		TYPE_STRING_NAME:
			return "string name"
		TYPE_TRANSFORM2D:
			return "2D transform"
		TYPE_TRANSFORM3D:
			return "3D transform"
		TYPE_VECTOR2:
			return "2D vector"
		TYPE_VECTOR2I:
			return "2D integer vector"
		TYPE_VECTOR3:
			return "3D vector"
		TYPE_VECTOR3I:
			return "3D integer vector"
		TYPE_VECTOR4:
			return "4D vector"
		TYPE_VECTOR4I:
			return "4D integer vector"
	return "unknown"
