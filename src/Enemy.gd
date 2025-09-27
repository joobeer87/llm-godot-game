extends CharacterBody2D

@export var speed: float = 100.0

func _physics_process(delta: float) -> void:
    velocity = Vector2(-speed, 0)
    move_and_slide()

    if position.x < -100:
        queue_free()
