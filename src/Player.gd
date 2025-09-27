extends CharacterBody2D

@export var speed: float = 200.0

func _physics_process(delta: float) -> void:
    # Calculate input vector using defined input actions
    var input_vector = Vector2(
        Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
        Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
    )
    if input_vector.length() > 0:
        input_vector = input_vector.normalized()
    velocity = input_vector * speed
    move_and_slide()
