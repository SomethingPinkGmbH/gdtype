@tool
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
			return "Array"
		TYPE_BASIS:
			return "Basis"
		TYPE_BOOL:
			return "bool"
		TYPE_CALLABLE:
			return "Callable"
		TYPE_COLOR:
			return "Color"
		TYPE_DICTIONARY:
			return "Dictionary"
		TYPE_FLOAT:
			return "float"
		TYPE_INT:
			return "int"
		TYPE_MAX:
			return "max"
		TYPE_NIL:
			return "null"
		TYPE_NODE_PATH:
			return "NodePath"
		TYPE_OBJECT:
			return "Object"
		TYPE_PACKED_BYTE_ARRAY:
			return "PackedByteArray"
		TYPE_PACKED_COLOR_ARRAY:
			return "PackedColorArray"
		TYPE_PACKED_FLOAT32_ARRAY:
			return "PackedFloat32Array"
		TYPE_PACKED_FLOAT64_ARRAY:
			return "PackedFloat64Array"
		TYPE_PACKED_INT32_ARRAY:
			return "PackedInt32Array"
		TYPE_PACKED_INT64_ARRAY:
			return "PackedInt64Array"
		TYPE_PACKED_STRING_ARRAY:
			return "PackedStringArray"
		TYPE_PACKED_VECTOR2_ARRAY:
			return "Packed2DVectorArray"
		TYPE_PACKED_VECTOR3_ARRAY:
			return "Packed3DVectorArray"
		TYPE_PLANE:
			return "Plane"
		TYPE_PROJECTION:
			return "Projection"
		TYPE_QUATERNION:
			return "Quaternion"
		TYPE_RECT2:
			return "Rect2"
		TYPE_RECT2I:
			return "Rect2i"
		TYPE_RID:
			return "RID"
		TYPE_SIGNAL:
			return "Signal"
		TYPE_STRING:
			return "String"
		TYPE_STRING_NAME:
			return "StringName"
		TYPE_TRANSFORM2D:
			return "2DTransform"
		TYPE_TRANSFORM3D:
			return "3DTransform"
		TYPE_VECTOR2:
			return "Vector2"
		TYPE_VECTOR2I:
			return "Vector2i"
		TYPE_VECTOR3:
			return "Vector3"
		TYPE_VECTOR3I:
			return "Vector3i"
		TYPE_VECTOR4:
			return "Vector4"
		TYPE_VECTOR4I:
			return "Vector4i"
	return "unknown"
