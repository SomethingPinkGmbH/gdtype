# Typing extensions for Godot

This library provides typing extensions for Godot for your convenience.

## Get the type name of a variable

```gdscript
print(Type.get_type_name("Hello world!"))
```

## Get the type name of a type

```gdscript
print(Type.get_string_name(typeof("Hello world!")))
```

## Get the class name from a class

> [!NOTE]
> This does not work on inner classes due to a Godot limitation.

```gdscript
class_name MyTestClass
extends Node

func _ready():
    print(Class.get_string_name(MyTestClass))
```

## Get the class name from a class instance

> [!NOTE]
> This does not work on inner classes due to a Godot limitation.

```gdscript
class_name MyTestClass
extends Node

func _ready():
    print(Class.get_object_class_name(self))
```

## Get class from a class instance

> [!NOTE]
> This does not work on inner classes due to a Godot limitation.

```gdscript
class_name MyTestClass
extends Node

func _ready():
    var cls = Class.get_object_class(self)
```

## Get a useful printable name for (almost) anything

> [!NOTE]
> This does not work on inner classes due to a Godot limitation.

```gdscript
class_name MyTestClass
extends Node

func _ready():
    print(Class.get_variable_class_or_type_name(self))
    print(Class.get_variable_class_or_type_name("Hello world!"))
```
