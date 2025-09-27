extends Node2D

@export var grow_time: float = 2.0

func _ready() -> void:
    var timer = get_tree().create_timer(grow_time)
    timer.timeout.connect(_on_grow)

func _on_grow() -> void:
    # Indicate growth by changing color
    modulate = Color(0.4, 1.0, 0.4)
